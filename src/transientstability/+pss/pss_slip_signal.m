function output = pss_slip_signal(casedata)
%------Slip signal based PSS----

nb=size(casedata.bus,1);
[mm, output.order_slip_pss]=sort([setxor(1:nb,casedata.dynamicdata.slip_pss(:,1)'),casedata.dynamicdata.slip_pss(:,1)']);

[Kslip_pss, Td1_slip, ...
    Tw_slip, T1_slip, T2_slip, VS_slip_max, VS_slip_min] = utils.matsplit(casedata.dynamicdata.slip_pss(:,2:8),1);


%% Making the variables into Struct
variableValues = {Kslip_pss; Td1_slip; ...
    Tw_slip; T1_slip; T2_slip; VS_slip_max; VS_slip_min};

variableNames = {'Kslip_pss'; 'Td1_slip'; ...
    'Tw_slip'; 'T1_slip'; 'T2_slip'; 'VS_slip_max'; 'VS_slip_min';};
        
%         output = [];
        for i=1:length(variableNames)
             output = setfield(output,char(variableNames(i)),cell2mat(variableValues(i)));
        end