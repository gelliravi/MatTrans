function output = makePSSInitialConditions(casedata)

[NG_STATIC, NG_ST1A, NG_ST2A, NG_AC4A, NG_AC1A, NG_DC1A, ...
    NG_HYDRO, NG_NRT, NG_RHT, ...
    NG_SLIP_PSS, NG_POWER_PSS, NG_FREQ_PSS, NG_DELPW_PSS] = utils.idx_gen_components;

nb=size(casedata.bus,1);
%% ---------------PSS models----------------------
output.pss_slip_signalParameters = pss.pss_slip_signal(casedata);
output.pss_power_signalParameters = pss.pss_power_signal(casedata);
output.pss_freq_signalParameters = pss.pss_freq_signal(casedata);
output.pss_delPw_signalParameters = pss.pss_delPw_signal(casedata);

%% ---Main Selector for PSS----
PSS = casedata.dynamicdata.gen_components_Mainselector.PSS;

%% ----Selectors for individual type of PSS----
SL_slip_pss=ones(nb,1); SL_power_pss=ones(nb,1); SL_freq_pss=ones(nb,1);
SL_delPw_pss=ones(nb,1);

% Indicate the generator number on which a specfic type of PSS is to be enabled, otherwise nullmatrix
ng_slip_pss=casedata.dynamicdata.gen_components(find(casedata.dynamicdata.gen_components(:,4)== NG_SLIP_PSS),1);
ng_power_pss=casedata.dynamicdata.gen_components(find(casedata.dynamicdata.gen_components(:,4)== NG_POWER_PSS),1);
ng_freq_pss=casedata.dynamicdata.gen_components(find(casedata.dynamicdata.gen_components(:,4)== NG_FREQ_PSS),1);
ng_delPw_pss=casedata.dynamicdata.gen_components(find(casedata.dynamicdata.gen_components(:,4)== NG_DELPW_PSS),1);

SL_slip_pss(ng_slip_pss)=0;
SL_power_pss(ng_power_pss)=0;
SL_freq_pss(ng_freq_pss)=0;
SL_delPw_pss(ng_delPw_pss)=0;

%% Making the variables into Struct
variableValues = {PSS; SL_slip_pss; SL_power_pss; SL_freq_pss; SL_delPw_pss; };

variableNames = {'PSS'; 'SL_slip_pss'; 'SL_power_pss'; 'SL_freq_pss'; 'SL_delPw_pss';};
        
%         output = [];
        for i=1:length(variableNames)
             output = setfield(output,char(variableNames(i)),cell2mat(variableValues(i)));
        end
