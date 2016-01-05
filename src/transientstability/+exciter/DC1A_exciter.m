function output = DC1A_exciter(casedata,exciterInitialCondition)
% IEEE type-1 Exciters 

nb=size(casedata.bus,1);
lfl=casedata.dynamicdata.extraVariables.lfl;
[mm, output.order_DC1A]=sort([setxor(1:nb,casedata.dynamicdata.exc_DC1A(:,1)'),casedata.dynamicdata.exc_DC1A(:,1)']);


[Tr_DC1A, KA_DC1A, TA_DC1A, TC_DC1A, TB_DC1A,...
    VRmax_DC1A, VRmin_DC1A, KE_DC1A, TE_DC1A, ...
    E1, SE1, E2, SE2, KF_DC1A, TF_DC1A] = utils.matsplit(casedata.dynamicdata.exc_DC1A(:,2:16),1);

Efd0_DC1A=exciterInitialCondition.EFD0(casedata.dynamicdata.exc_DC1A(:,1));
output.Efd0_DC1A=Efd0_DC1A;

%calculation of saturation function coef., A and B in  SE=A*exp(B*Efd)
B_DC1A=(1./(E1-E2)).*log(SE1./SE2);
A_DC1A=SE1./(exp(B_DC1A.*E1));

VR0_DC1A=(A_DC1A.*exp(B_DC1A.*Efd0_DC1A)+KE_DC1A).*Efd0_DC1A;
Vref_DC1A=VR0_DC1A./KA_DC1A + lfl(casedata.dynamicdata.exc_DC1A(:,1),2);
Fst0_DC1A=Efd0_DC1A.*KF_DC1A;
Tgr0_DC1A=(Vref_DC1A - lfl(casedata.dynamicdata.exc_DC1A(:,1),2)).*(1-TC_DC1A./TB_DC1A);

%% Making the variables into Struct
variableValues = {Tr_DC1A; KA_DC1A; TA_DC1A; TC_DC1A; TB_DC1A;...
    VRmax_DC1A; VRmin_DC1A; KE_DC1A; TE_DC1A; ...
    E1; SE1; E2; SE2; KF_DC1A; TF_DC1A; ...
    B_DC1A;A_DC1A;...
    VR0_DC1A; Vref_DC1A; Fst0_DC1A; Tgr0_DC1A };

variableNames = {'Tr_DC1A'; 'KA_DC1A'; 'TA_DC1A'; 'TC_DC1A'; 'TB_DC1A';...
    'VRmax_DC1A'; 'VRmin_DC1A'; 'KE_DC1A'; 'TE_DC1A'; ...
    'E1'; 'SE1'; 'E2'; 'SE2'; 'KF_DC1A'; 'TF_DC1A'; ...
    'B_DC1A'; 'A_DC1A';...
    'VR0_DC1A'; 'Vref_DC1A'; 'Fst0_DC1A'; 'Tgr0_DC1A'};
        
%         output = [];
        for i=1:length(variableNames)
             output = setfield(output,char(variableNames(i)),cell2mat(variableValues(i)));
        end

