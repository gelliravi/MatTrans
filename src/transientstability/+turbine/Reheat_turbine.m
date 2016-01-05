function output = Reheat_turbine(casedata,turbineInitialCondition)
% Speed governer with reheat type turbine

nb=size(casedata.bus,1);

[mm, output.order_rhst]=sort([setxor(1:nb,casedata.dynamicdata.turb_rhst(:,1)'),casedata.dynamicdata.turb_rhst(:,1)']);

[T1_rht, T2_rht, T3_rht, sig_rht, ...
    Pgv_rht_max, Pgv_rht_min, ...
    TCH_rht, TRH_rht, TCO_rht, FHP_rht, FIP_rht, FLP_rht] = utils.matsplit(casedata.dynamicdata.turb_rhst(:,2:13),1);

K_rht=1./sig_rht;
Pgv_rht0=turbineInitialCondition.TmA0(casedata.dynamicdata.turb_rhst(:,1));
HP_rht0=Pgv_rht0;
IP_rht0=Pgv_rht0;
LP_rht0=Pgv_rht0;


%% Making the variables into Struct
variableValues = {T1_rht; T2_rht; T3_rht; sig_rht; ...
    Pgv_rht_max; Pgv_rht_min; ...
    TCH_rht; TRH_rht; TCO_rht; FHP_rht; FIP_rht; FLP_rht;...
    K_rht; Pgv_rht0; HP_rht0; IP_rht0; LP_rht0};

variableNames = {'T1_rht'; 'T2_rht'; 'T3_rht'; 'sig_rht'; ...
    'Pgv_rht_max'; 'Pgv_rht_min'; ...
    'TCH_rht'; 'TRH_rht'; 'TCO_rht'; 'FHP_rht'; 'FIP_rht'; 'FLP_rht';...
    'K_rht'; 'Pgv_rht0'; 'HP_rht0'; 'IP_rht0'; 'LP_rht0';};
        
%         output = [];
        for i=1:length(variableNames)
             output = setfield(output,char(variableNames(i)),cell2mat(variableValues(i)));
        end