function output = pss_power_signal(casedata)
%Power signal based PSS

nb=size(casedata.bus,1);
[mm, output.order_power_pss]=sort([setxor(1:nb,casedata.dynamicdata.power_pss(:,1)'),casedata.dynamicdata.power_pss(:,1)']);

Tm0_power=casedata.dynamicdata.gen_turbineParameters.turbineInitialCondition.TmA0(casedata.dynamicdata.power_pss(:,1)');

[Tw_power, Td1_power, ...
    Kpower_pss, VS_power_max, VS_power_min] =  utils.matsplit(casedata.dynamicdata.power_pss(:,2:6),1);


%% Making the variables into Struct
variableValues = {Tw_power; Td1_power; ...
    Kpower_pss; VS_power_max; VS_power_min; ...
    Tm0_power};

variableNames = {'Tw_power'; 'Td1_power'; ...
    'Kpower_pss'; 'VS_power_max'; 'VS_power_min'; ...
    'Tm0_power';};
        
%         output = [];
        for i=1:length(variableNames)
             output = setfield(output,char(variableNames(i)),cell2mat(variableValues(i)));
        end