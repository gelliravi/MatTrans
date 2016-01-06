function output = runtsSimulink(mpc)

%% Get matlab version
matlabVersion=ver('simulink');
sys = strcat('transientStability_',upper(matlabVersion.Release(2:end-1)),'.mdl');
open_system(sys);
options = simset('SrcWorkspace','current', 'OutputPoints', 'specified');
simResult = sim(sys,[],options);

%% Making the variables into Struct
variableValues = {w; delta;COI; delta_COI; Efd_var; If_var; Te_out; Tm_out; Vbus; Vs; ...
    Tm;};

variableNames = {'w';'delta'; 'COI'; 'delta_COI'; 'Efd_var'; 'If_var'; 'Te_out'; 'Tm_out'; 'Vbus'; 'Vs'; ...
    'Tm';};
        
        output = [];
        for i=1:length(variableNames)
             output = setfield(output,char(variableNames(i)),cell2mat(variableValues(i)));
        end
