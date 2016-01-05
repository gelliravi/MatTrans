function output = load_zip_model(casedata,loadInitialCondition)
%-------------------Load Modelling------------------
nb=size(casedata.bus,1);
ld=find(casedata.bus(:,3)>0); % This size(PD>0)
[mm, output.order_load]=sort([setxor(1:nb,ld(:,1)'),ld(:,1)']);

%Real power component: (p1+p2+p3=1)
% p1=0.3;
% p2=0.3;
% p3=0.4;
p1=0;
p2=0.5;
p3=0.5;
%Reactive power component: (r1+r2+r3 =1)
r1=0;
r2=0;
r3=1;

% constant Power type
kcpr=r1*loadInitialCondition.QL0;
kcp=p1*loadInitialCondition.PL0;
% constant current type
kccr=r2*loadInitialCondition.QL0./loadInitialCondition.VL0;
kcc= p2*loadInitialCondition.PL0./loadInitialCondition.VL0;
% constant impedance type
kcir=r3*loadInitialCondition.QL0./(loadInitialCondition.VL0.^2);
kci=p3*loadInitialCondition.PL0./(loadInitialCondition.VL0.^2);

TL=0.01;

%% Making the variables into Struct
variableValues = {kcpr; kcp; kccr; kcc; kcir;kci; TL};

variableNames = {'kcpr'; 'kcp'; 'kccr'; 'kcc'; 'kcir'; 'kci';'TL'};
        
%         output = [];
        for i=1:length(variableNames)
             output = setfield(output,char(variableNames(i)),cell2mat(variableValues(i)));
        end
