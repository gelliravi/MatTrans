function output = AC1A_exciter(casedata,exciterInitialCondition)
% IEEE AC1A Exciters

nb=size(casedata.bus,1);
lfl=casedata.dynamicdata.extraVariables.lfl;
[mm, output.order_AC1A]=sort([setxor(1:nb,casedata.dynamicdata.exc_AC1A(:,1)'),casedata.dynamicdata.exc_AC1A(:,1)']);

[Tr_AC1A, kA_AC1A, TA_AC1A, TC_AC1A, TB_AC1A, ...
    VAmax_AC1A, VAmin_AC1A, VRmax_AC1A, VRmin_AC1A, ...
    KE_AC1A, TE_AC1A, E1_AC1A, SE1_AC1A, E2_AC1A, SE2_AC1A,...
    KF_AC1A, TF_AC1A, KD_AC1A, KC_AC1A ] = utils.matsplit(casedata.dynamicdata.exc_AC1A(:,2:20),1);


Efd0_AC1A=exciterInitialCondition.EFD0(casedata.dynamicdata.exc_AC1A(:,1));
output.Efd0_AC1A=Efd0_AC1A;
IFD0_AC1A=exciterInitialCondition.IFD0_a(casedata.dynamicdata.exc_AC1A(:,1));
output.IFD0_AC1A=IFD0_AC1A;

%calculation of saturation function coef., A and B in  SE=A*exp(B*Efd)
B1=(1./(E1_AC1A-E2_AC1A)).*log(SE1_AC1A./SE2_AC1A);
A1=SE1_AC1A./(exp(B1.*E1_AC1A));

for i=1:size(casedata.dynamicdata.exc_AC1A,1)
    IFD=IFD0_AC1A(i);
    Kc_AC1A=KC_AC1A(i);
		for Ve=1.5:0.0001:20
   			In(i)=(Kc_AC1A.*IFD)./Ve;
   		if In(i)<=0.433
      		Fex_AC1A(i)=1-(0.577.*In(i));
   			else if In(i)<0.75
         			Fex_AC1A(i)=sqrt(0.75-In(i)^2);
      				else if In(i)<=1
            				Fex_AC1A(i)=1.732.*(1-In(i));
         				  else Fex_AC1A(i)=0;
         			end
      		end
   		end
    			Efd1=Fex_AC1A(i).*Ve;
     		if Efd1>=Efd0_AC1A(i)
       		break
       	end
    	end
  Ve_AC1A(i)=Ve;
 end


Vfe_AC1A=((KD_AC1A.*IFD0_AC1A)+Ve_AC1A'.*(KE_AC1A+A1.*exp(B1.*Ve_AC1A')));
VR0_AC1A=Vfe_AC1A;

Vref_AC1A=VR0_AC1A./kA_AC1A + lfl(casedata.dynamicdata.exc_AC1A(:,1),2);
Fst0_AC1A=Vfe_AC1A.*KF_AC1A;


Tgr0_AC1A=(Vref_AC1A - lfl(casedata.dynamicdata.exc_AC1A(:,1),2)).*(1-TC_AC1A./TB_AC1A);


%% Making the variables into Struct
variableValues = {Tr_AC1A; kA_AC1A; TA_AC1A; TC_AC1A; TB_AC1A; ...
    VAmax_AC1A; VAmin_AC1A; VRmax_AC1A; VRmin_AC1A; ...
    KE_AC1A; TE_AC1A; E1_AC1A; SE1_AC1A; E2_AC1A; SE2_AC1A;...
    KF_AC1A; TF_AC1A; KD_AC1A; KC_AC1A; ...
    B1; A1;...
    Ve_AC1A'; Vfe_AC1A; VR0_AC1A; Vref_AC1A; Fst0_AC1A; Tgr0_AC1A;...
    };

variableNames = {'Tr_AC1A'; 'kA_AC1A'; 'TA_AC1A'; 'TC_AC1A'; 'TB_AC1A'; ...
    'VAmax_AC1A'; 'VAmin_AC1A'; 'VRmax_AC1A'; 'VRmin_AC1A'; ...
    'KE_AC1A'; 'TE_AC1A'; 'E1_AC1A'; 'SE1_AC1A'; 'E2_AC1A'; 'SE2_AC1A';...
    'KF_AC1A'; 'TF_AC1A'; 'KD_AC1A'; 'KC_AC1A';...
    'B1'; 'A1';...
    'Ve_AC1A';'Vfe_AC1A'; 'VR0_AC1A'; 'Vref_AC1A'; 'Fst0_AC1A'; 'Tgr0_AC1A';...
     };
        
%         output = [];
        for i=1:length(variableNames)
             output = setfield(output,char(variableNames(i)),cell2mat(variableValues(i)));
        end
