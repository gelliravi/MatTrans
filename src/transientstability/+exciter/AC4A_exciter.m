function output = AC4A_exciter(casedata,exciterInitialCondition)
% Alternator supplied Controlled Rectifier: AC4A type-

nb=size(casedata.bus,1);
lfl=casedata.dynamicdata.extraVariables.lfl;

[mm, output.order_AC4A]=sort([setxor(1:nb,casedata.dynamicdata.exc_AC4A(:,1)'),casedata.dynamicdata.exc_AC4A(:,1)']);

[Tr_AC4A, kA_AC4A, TA_AC4A, TC_AC4A, TB_AC4A, ...
    VImax_AC4A, VImin_AC4A, VRmin_AC4A, VRmax_AC4A, KC_AC4A]= utils.matsplit(casedata.dynamicdata.exc_AC4A(:,2:11),1);


Efd0_AC4A=exciterInitialCondition.EFD0(casedata.dynamicdata.exc_AC4A(:,1));
output.Efd0_AC4A=Efd0_AC4A;

Vref_AC4A=Efd0_AC4A./kA_AC4A + lfl(casedata.dynamicdata.exc_AC4A(:,1),2);
Tgr0_AC4A=(Vref_AC4A - lfl(casedata.dynamicdata.exc_AC4A(:,1),2)).*(1-TC_AC4A./TB_AC4A);

%% Making the variables into Struct
variableValues = {Tr_AC4A; kA_AC4A; TA_AC4A; TC_AC4A; TB_AC4A; ...
    VImax_AC4A; VImin_AC4A; VRmin_AC4A; VRmax_AC4A; KC_AC4A;...
    Vref_AC4A; Tgr0_AC4A};

variableNames = {'Tr_AC4A'; 'kA_AC4A'; 'TA_AC4A'; 'TC_AC4A'; 'TB_AC4A'; ...
    'VImax_AC4A'; 'VImin_AC4A'; 'VRmin_AC4A'; 'VRmax_AC4A'; 'KC_AC4A';...
    'Vref_AC4A'; 'Tgr0_AC4A'};
        
%         output = [];
        for i=1:length(variableNames)
             output = setfield(output,char(variableNames(i)),cell2mat(variableValues(i)));
        end
