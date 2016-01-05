function output = ST2A_exciter(casedata,exciterInitialCondition)
%-------------------Compound source rectifier exciter: ST2A TYPE----------------

nb=size(casedata.bus,1);
lfl=casedata.dynamicdata.extraVariables.lfl;

[mm, output.order_ST2A]=sort([setxor(1:nb,casedata.dynamicdata.exc_ST2A(:,1)'),casedata.dynamicdata.exc_ST2A(:,1)']);

[kA_ST2A, TA_ST2A, KE_ST2A, TE_ST2A, KC_ST2A, KF_ST2A, TF_ST2A, ...
    VRmax_ST2A, VRmin_ST2A, KP_ST2A, KI_ST2A, EFDmax_ST2A] = utils.matsplit(casedata.dynamicdata.exc_ST2A(:,2:13),1);



Efd0_ST2A=exciterInitialCondition.EFD0(casedata.dynamicdata.exc_ST2A(:,1));
output.Efd0_ST2A=Efd0_ST2A;
IFD0_ST2A=exciterInitialCondition.IFD0_a(casedata.dynamicdata.exc_ST2A(:,1));
output.IFD0_ST2A=IFD0_ST2A;


Fst0_ST2A=Efd0_ST2A.*KF_ST2A;
VE_ST2A=abs(KP_ST2A.*exciterInitialCondition.Vg0bar_a(casedata.dynamicdata.exc_ST2A(:,1))+j*KI_ST2A.*exciterInitialCondition.Ig0bar_a(casedata.dynamicdata.exc_ST2A(:,1)));
In_ST2A=(KC_ST2A.*IFD0_ST2A)./VE_ST2A;

for i=1:size(casedata.dynamicdata.exc_ST2A,1)
if In_ST2A(i)<=0.433
   Fex_ST2A(i)=(1-0.577*In_ST2A(i));
   else if In_ST2A(i)<0.75
      Fex_ST2A(i)=sqrt(0.75-In_ST2A(i)^2);
   else if In_ST2A(i)<=1
         Fex_ST2A(i)=1.732*(1-In_ST2A(i));
      else Fex_ST2A(i)=0;
      end
   end
end
end

Vb_ST2A=VE_ST2A.*Fex_ST2A';
VR0_ST2A=(KE_ST2A.*Efd0_ST2A)./(Vb_ST2A);
Vref_ST2A=(VR0_ST2A)./(kA_ST2A)+lfl(casedata.dynamicdata.exc_ST2A(:,1),2);



%% Making the variables into Struct
variableValues = {kA_ST2A; TA_ST2A; KE_ST2A; TE_ST2A; KC_ST2A; KF_ST2A; TF_ST2A; ...
    VRmax_ST2A; VRmin_ST2A; KP_ST2A; KI_ST2A; EFDmax_ST2A; ...
   Fst0_ST2A; VE_ST2A; In_ST2A; Vb_ST2A; VR0_ST2A; Vref_ST2A};

variableNames = {'kA_ST2A'; 'TA_ST2A'; 'KE_ST2A'; 'TE_ST2A'; 'KC_ST2A'; 'KF_ST2A'; 'TF_ST2A'; ...
    'VRmax_ST2A'; 'VRmin_ST2A'; 'KP_ST2A'; 'KI_ST2A'; 'EFDmax_ST2A';...
   'Fst0_ST2A'; 'VE_ST2A'; 'In_ST2A'; 'Vb_ST2A'; 'VR0_ST2A'; 'Vref_ST2A'};
        
%         output = [];
        for i=1:length(variableNames)
             output = setfield(output,char(variableNames(i)),cell2mat(variableValues(i)));
        end
