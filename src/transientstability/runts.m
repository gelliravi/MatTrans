function mpc = runts(casedata, dynamiccasedata, mpopt, fname, solvedcase)
%RUNTS  Runs a Transient Stability.
%   mpc = RUNTS(CASEDATA, MPOPT, FNAME, SOLVEDCASE)
%   Example 1: runts(data.case10, data.case10dd)
%   Runs a Transient Stability (First executes power flow then simulate transtability.mdl), optionally
%   returning a RESULTS struct and SUCCESS flag.

%% Import code files
import +data.*;
import +exciter.*;
import +generator.*;
import +load.*;
import +pss.*;
import +turbine.*;
import +utils.*;
import +Yform.*;

%% define named indices into bus, gen, branch matrices
[NG_STATIC, NG_ST1A, NG_ST2A, NG_AC4A, NG_AC1A, NG_DC1A, ...
    NG_HYDRO, NG_NRT, NG_RHT, ...
    NG_SLIP_PSS, NG_POWER_PSS, NG_FREQ_PSS] = utils.idx_gen_components;

%% default arguments
if nargin < 5
    solvedcase = '';                %% don't save solved case
    if nargin < 4
        fname = '';                 %% don't print results to a file
        if nargin < 3
            mpopt = mpoption;       %% use default options
            if nargin < 2
                dynamiccasedata = data.case10dd; %% default data file is 'case10.m'
                if nargin < 1
                casedata = data.case10; %% default data file is 'case10.m'
                dynamiccasedata = data.case10dd; %% default data file is 'case10dd.m'
                end
            end
        end
    end
end


%% Execute steady-state power flow
opt = mpoption('PF_ALG', 2, 'VERBOSE', 3); % Eg: FDXB algo
mpc = runpf(casedata, opt);

%% Add dynamicdata to the struct mpc
mpc.dynamicdata = dynamiccasedata;

%% Extra variables that are used in the model
mpc.dynamicdata.extraVariables=utils.makeExtraVariables(mpc);
mpc = rmfield(mpc,'order');
mpc = rmfield(mpc,'gen'); % This is removed because 'gen' fieldname has been used in the simulink model.

%% -----  INITIAL CONDITIONS FOR GENERATOR  ----- %%
mpc.dynamicdata.gen_parameters = generator.makeGenDynamicData(mpc);

%% Initialization of Exciters and Enable/Disable them to corresponding generators
mpc.dynamicdata.gen_exciterParameters = exciter.makeExciterInitialConditions(mpc);

%% Initialization of Turbine and Speed Governers (SG) and Enable/Disable them to corresponding generators
mpc.dynamicdata.gen_turbineParameters = turbine.makeTurbineAndSGInitialConditions(mpc);

%% Initialization of PSS Models and Enable/Disable them to corresponding generators
mpc.dynamicdata.gen_pssParameters = pss.makePSSInitialConditions(mpc);

%% Load Modeling
mpc.dynamicdata.load = load.makeLoadModel(mpc);

%% For checking models at the time of builbing blocks
mpc.dynamicdata.busang=mpc.dynamicdata.extraVariables.lfl(:,3)*pi/180;
mpc.dynamicdata.Vpre=mpc.dynamicdata.extraVariables.lfl(:,2).*(cos(mpc.dynamicdata.busang)+j*sin(mpc.dynamicdata.busang));

%% Yform Modeling - prepares w.r.t line trips
mpc.dynamicdata.Yform = Yform.makeYform(mpc);

% assignin('base','mpc',mpc)
%% Executing transientStability.mdl
mpc.tsResult = utils.runtsSimulink(mpc);

% EOF