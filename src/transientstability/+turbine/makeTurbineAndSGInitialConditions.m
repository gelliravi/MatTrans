function output = makeTurbineAndSGInitialConditions(casedata)

[NG_STATIC, NG_ST1A, NG_ST2A, NG_AC4A, NG_AC1A, NG_DC1A, ...
    NG_HYDRO, NG_NRT, NG_RHT, ...
    NG_SLIP_PSS, NG_POWER_PSS, NG_FREQ_PSS, NG_DELPW_PSS] = utils.idx_gen_components;


nb=size(casedata.bus,1);
ngen=size(casedata.dynamicdata.gen,1);

H1=[zeros(1, nb-ngen)'; casedata.dynamicdata.gen_parameters.H];
H_a=H1(casedata.dynamicdata.gen_parameters.order_gen);

Tm01=[zeros(1, nb-ngen)'; casedata.dynamicdata.gen_parameters.Tm0];
TmA0=Tm01(casedata.dynamicdata.gen_parameters.order_gen);


%% Making the variables into Struct
variableValues = {H1; H_a; Tm01; TmA0};
variableNames = {'H1'; 'H_a'; 'Tm01'; 'TmA0'};
        
        turbineInitialCondition = [];
        for i=1:length(variableNames)
             turbineInitialCondition = setfield(turbineInitialCondition,char(variableNames(i)),cell2mat(variableValues(i)));
        end
        output.turbineInitialCondition=turbineInitialCondition;

%% Setting turbine parameters
output.hydro_turbineParameters = turbine.hydro_turbine(casedata,turbineInitialCondition);
output.NonReheat_turbineParameters = turbine.NonReheat_turbine(casedata,turbineInitialCondition);
output.Reheat_turbineParameters = turbine.Reheat_turbine(casedata,turbineInitialCondition);

%% Main Selector for Turbine models
TURB = casedata.dynamicdata.gen_components_Mainselector.TURB;


SL_HYDRO=ones(nb,1); SL_NRST=ones(nb,1); SL_RHST=ones(nb,1);

%-----Indicate the generator number on which a specfic type of speed-governor-turbine is to be enabled, otherwise null
ng_hydro=casedata.dynamicdata.gen_components(find(casedata.dynamicdata.gen_components(:,3)== NG_HYDRO),1);
ng_nrt=casedata.dynamicdata.gen_components(find(casedata.dynamicdata.gen_components(:,3)== NG_NRT),1);
ng_rht=casedata.dynamicdata.gen_components(find(casedata.dynamicdata.gen_components(:,3)== NG_RHT),1);

SL_HYDRO(ng_hydro)=0;
SL_NRST(ng_nrt)=0;
SL_RHST(ng_rht)=0;


%% Making the variables into Struct
variableValues = {TURB; SL_HYDRO; SL_NRST; SL_RHST;  };

variableNames = {'TURB'; 'SL_HYDRO'; 'SL_NRST'; 'SL_RHST'; };
        
%         output = [];
        for i=1:length(variableNames)
             output = setfield(output,char(variableNames(i)),cell2mat(variableValues(i)));
        end
      
