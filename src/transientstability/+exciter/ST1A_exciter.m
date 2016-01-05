function output = ST1A_exciter(casedata,exciterInitialCondition)
%----------------------Static -ST1A type exciters------------------

nb=size(casedata.bus,1);
lfl=casedata.dynamicdata.extraVariables.lfl;

[mm, output.order_ST1A]=sort([setxor(1:nb,casedata.dynamicdata.exc_ST1A(:,1)'),casedata.dynamicdata.exc_ST1A(:,1)']);

[Tr_ST1A, TC_ST1A, TB_ST1A, kA_ST1A, TA_ST1A, KF_ST1A, TF_ST1A,...
    VRmax_ST1A, VRmin_ST1A, KC_ST1A, KLR_ST1A, ILR_ST1A] = utils.matsplit(casedata.dynamicdata.exc_ST1A(:,2:13),1);


Efd0_ST1A=exciterInitialCondition.EFD0(casedata.dynamicdata.exc_ST1A(:,1));
output.Efd0_ST1A=Efd0_ST1A;

Vref_ST1A=Efd0_ST1A./kA_ST1A + lfl(casedata.dynamicdata.exc_ST1A(:,1),2);
Tgr0_ST1A=(Vref_ST1A - lfl(casedata.dynamicdata.exc_ST1A(:,1),2)).*(1-TC_ST1A./TB_ST1A);
Fst0_ST1A=Efd0_ST1A.*KF_ST1A;


%% Making the variables into Struct
variableValues = {Tr_ST1A; TC_ST1A; TB_ST1A; kA_ST1A; TA_ST1A; KF_ST1A; TF_ST1A;...
    VRmax_ST1A; VRmin_ST1A; KC_ST1A; KLR_ST1A; ILR_ST1A;...
    Vref_ST1A; Tgr0_ST1A; Fst0_ST1A};

variableNames = {'Tr_ST1A'; 'TC_ST1A'; 'TB_ST1A'; 'kA_ST1A'; 'TA_ST1A'; 'KF_ST1A'; 'TF_ST1A';...
    'VRmax_ST1A'; 'VRmin_ST1A'; 'KC_ST1A'; 'KLR_ST1A'; 'ILR_ST1A';...
    'Vref_ST1A'; 'Tgr0_ST1A'; 'Fst0_ST1A'};
        
%         output = [];
        for i=1:length(variableNames)
             output = setfield(output,char(variableNames(i)),cell2mat(variableValues(i)));
        end

