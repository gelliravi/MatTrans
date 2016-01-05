function output = NonReheat_turbine(casedata,turbineInitialCondition)
% Speed governer with nonreheat type turbine
nb=size(casedata.bus,1);
[mm, output.order_nrst]=sort([setxor(1:nb,casedata.dynamicdata.turb_nrst(:,1)'),casedata.dynamicdata.turb_nrst(:,1)']);

[Tch_nrt, sig_nrt, T1_nrt, T2_nrt, T3_nrt, Pgv_nrt_max, Pgv_nrt_min] = utils.matsplit(casedata.dynamicdata.turb_nrst(:,2:8),1);

K_nrt=1./sig_nrt;
Pgv_nrt0=turbineInitialCondition.TmA0(casedata.dynamicdata.turb_nrst(:,1));


%% Making the variables into Struct
variableValues = {Tch_nrt; sig_nrt; T1_nrt; T2_nrt; T3_nrt; Pgv_nrt_max; Pgv_nrt_min; ...
    K_nrt; Pgv_nrt0;};

variableNames = {'Tch_nrt'; 'sig_nrt'; 'T1_nrt'; 'T2_nrt'; 'T3_nrt'; 'Pgv_nrt_max'; 'Pgv_nrt_min'; ...
    'K_nrt'; 'Pgv_nrt0';};
        
%         output = [];
        for i=1:length(variableNames)
             output = setfield(output,char(variableNames(i)),cell2mat(variableValues(i)));
        end