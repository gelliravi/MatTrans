function output = makeExciterInitialConditions(casedata)

[NG_STATIC, NG_ST1A, NG_ST2A, NG_AC4A, NG_AC1A, NG_DC1A, ...
    NG_HYDRO, NG_NRT, NG_RHT, ...
    NG_SLIP_PSS, NG_POWER_PSS, NG_FREQ_PSS, NG_DELPW_PSS] = utils.idx_gen_components;

nb=size(casedata.bus,1);
ngen=size(casedata.dynamicdata.gen,1);

%% ------Exciter Initial Condition calculations
EFD01=[zeros(1, nb-ngen)'; casedata.dynamicdata.gen_parameters.Efd0];
EFD0=EFD01(casedata.dynamicdata.gen_parameters.order_gen);

IFD01=[zeros(1, nb-ngen)'; casedata.dynamicdata.gen_parameters.IFD0];
IFD0_a=IFD01(casedata.dynamicdata.gen_parameters.order_gen);

Vg0bar1=[zeros(1, nb-ngen)'; casedata.dynamicdata.gen_parameters.Vg0bar];
Vg0bar_a=Vg0bar1(casedata.dynamicdata.gen_parameters.order_gen);

Ig0bar1=[zeros(1, nb-ngen)'; casedata.dynamicdata.gen_parameters.Ig0bar];
Ig0bar_a=Ig0bar1(casedata.dynamicdata.gen_parameters.order_gen);



%% Making the variables into Struct
variableValues = {EFD01; EFD0; IFD01; IFD0_a; Vg0bar1; Vg0bar_a; Ig0bar1; Ig0bar_a};

variableNames = {'EFD01', 'EFD0', 'IFD01', 'IFD0_a', 'Vg0bar1', 'Vg0bar_a', 'Ig0bar1', 'Ig0bar_a'};
        
        exciterInitialCondition = [];
        for i=1:length(variableNames)
             exciterInitialCondition = setfield(exciterInitialCondition,char(variableNames(i)),cell2mat(variableValues(i)));
        end
        output.exciterInitialCondition=exciterInitialCondition;


%% Exciters Parameters 
output.static_exciterParameters = exciter.static_exciter(casedata,exciterInitialCondition);
output.ST1A_exciterParameters = exciter.ST1A_exciter(casedata,exciterInitialCondition);
output.ST2A_exciterParameters = exciter.ST2A_exciter(casedata,exciterInitialCondition);
output.AC4A_exciterParameters = exciter.AC4A_exciter(casedata,exciterInitialCondition);
output.AC1A_exciterParameters = exciter.AC1A_exciter(casedata,exciterInitialCondition);
output.DC1A_exciterParameters = exciter.DC1A_exciter(casedata,exciterInitialCondition);

%% Main Selector for excitation systems.
AVR = casedata.dynamicdata.gen_components_Mainselector.AVR;

SL_static=ones(nb,1); SL_ST1A=ones(nb,1); SL_ST2A=ones(nb,1); SL_AC1A=ones(nb,1); 
SL_AC4A=ones(nb,1); SL_DC1A=ones(nb,1);


%Indicate the generator number on which a specfic type of exciter is to be enabled, otherwise null
ng_static=casedata.dynamicdata.gen_components(find(casedata.dynamicdata.gen_components(:,2)== NG_STATIC),1);
ng_ST1A=casedata.dynamicdata.gen_components(find(casedata.dynamicdata.gen_components(:,2)== NG_ST1A),1);
ng_ST2A=casedata.dynamicdata.gen_components(find(casedata.dynamicdata.gen_components(:,2)== NG_ST2A),1);
ng_AC1A=casedata.dynamicdata.gen_components(find(casedata.dynamicdata.gen_components(:,2)== NG_AC1A),1);
ng_AC4A=casedata.dynamicdata.gen_components(find(casedata.dynamicdata.gen_components(:,2)== NG_AC4A),1);
ng_DC1A=casedata.dynamicdata.gen_components(find(casedata.dynamicdata.gen_components(:,2)== NG_DC1A),1);

SL_static(ng_static)=0;
SL_ST1A(ng_ST1A)=0;
SL_ST2A(ng_ST2A)=0;
SL_AC1A(ng_AC1A)=0;
SL_AC4A(ng_AC4A)=0;
SL_DC1A(ng_DC1A)=0;


%% Making the variables into Struct
variableValues = {AVR; SL_static; SL_ST1A; SL_ST2A; SL_AC1A; SL_AC4A; SL_DC1A;};

variableNames = {'AVR'; 'SL_static'; 'SL_ST1A'; 'SL_ST2A'; 'SL_AC1A'; 'SL_AC4A'; 'SL_DC1A';};
        
%         output = [];
        for i=1:length(variableNames)
             output = setfield(output,char(variableNames(i)),cell2mat(variableValues(i)));
        end
