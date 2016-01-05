function output = makeLoadModel(casedata)

lfl=casedata.dynamicdata.extraVariables.lfl;
ld=casedata.dynamicdata.extraVariables.ld;

% Load varables
VL0=lfl(ld(:,1),2);
theL0=lfl(ld(:,1),3)*pi/180;
PL0=ld(:,2);
QL0=ld(:,3);
% set ZIP model coefficients in file *.m

%% Making the variables into Struct
variableValues = {VL0; theL0; PL0; QL0};

variableNames = {'VL0', 'theL0', 'PL0', 'QL0'};
        
        loadInitialCondition = [];
        for i=1:length(variableNames)
             loadInitialCondition = setfield(loadInitialCondition,char(variableNames(i)),cell2mat(variableValues(i)));
        end
        output.loadInitialCondition=loadInitialCondition;

output.load_zip_model=load.load_zip_model(casedata,loadInitialCondition);




