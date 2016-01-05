function output = pss_freq_signal(casedata)
%----Frequency signal based PSS----

nb=size(casedata.bus,1);
[mm, output.order_freq_pss]=sort([setxor(1:nb,casedata.dynamicdata.freq_pss(:,1)'),casedata.dynamicdata.freq_pss(:,1)']);

[Tw_freq, Td1_freq, ...
    Kfreq_pss, T1_freq, T2_freq, VS_freq_max, VS_freq_min] =  utils.matsplit(casedata.dynamicdata.freq_pss(:,2:8),1);


%% Making the variables into Struct
variableValues = {Tw_freq; Td1_freq; ...
    Kfreq_pss; T1_freq; T2_freq; VS_freq_max; VS_freq_min};

variableNames = {'Tw_freq'; 'Td1_freq'; ...
    'Kfreq_pss'; 'T1_freq'; 'T2_freq'; 'VS_freq_max'; 'VS_freq_min';};
        
%         output = [];
        for i=1:length(variableNames)
             output = setfield(output,char(variableNames(i)),cell2mat(variableValues(i)));
        end
