function output = hydro_turbine(casedata,turbineInitialCondition)
% speed Governer system with Hydro Turbine.

nb=size(casedata.bus,1);
[mm, output.order_hydro]=sort([setxor(1:nb,casedata.dynamicdata.turb_hydro(:,1)'),casedata.dynamicdata.turb_hydro(:,1)']);

[T_wht, TG_ht, sig_ht, T2_ht, Pgv_ht_max, Pgv_ht_min] = utils.matsplit(casedata.dynamicdata.turb_hydro(:,2:7),1);


TR_ht= 5*T_wht;
beta_ht=1.25*T_wht./turbineInitialCondition.H_a(casedata.dynamicdata.turb_hydro(:,1));

TA_ht=(1./sig_ht).*TR_ht.*TG_ht;
TB_ht=(1./sig_ht).*((beta_ht+sig_ht).*TR_ht + TG_ht);
T1_ht=TB_ht/2+ sqrt(TB_ht.^2/4-TA_ht);
T3_ht=TB_ht/2-sqrt(TB_ht.^2/4-TA_ht);
K_ht=1./sig_ht;

Tm0_hydr0=turbineInitialCondition.TmA0(casedata.dynamicdata.turb_hydro(:,1));
Pgv_ht0=Tm0_hydr0;

Tgr_ht0=(1-(-T_wht)./(0.5*T_wht)).*Pgv_ht0;


%% Making the variables into Struct
variableValues = {T_wht; TG_ht; sig_ht; T2_ht; Pgv_ht_max; Pgv_ht_min; ...
    TR_ht; beta_ht; TA_ht; TB_ht; T1_ht; T3_ht; K_ht; Tm0_hydr0; Pgv_ht0; Tgr_ht0};

variableNames = {'T_wht'; 'TG_ht'; 'sig_ht'; 'T2_ht'; 'Pgv_ht_max'; 'Pgv_ht_min'; ...
    'TR_ht'; 'beta_ht'; 'TA_ht'; 'TB_ht'; 'T1_ht'; 'T3_ht'; 'K_ht'; 'Tm0_hydr0'; 'Pgv_ht0'; 'Tgr_ht0'};
        
%         output = [];
        for i=1:length(variableNames)
             output = setfield(output,char(variableNames(i)),cell2mat(variableValues(i)));
        end

