function output = static_exciter(casedata,exciterInitialCondition)
%----------------------Static - type exciters------------------

nb=size(casedata.bus,1);
lfl=casedata.dynamicdata.extraVariables.lfl;

[mm, output.order_static]=sort([setxor(1:nb,casedata.dynamicdata.exc_static(:,1)'),casedata.dynamicdata.exc_static(:,1)']);

[kA_static, TA_static, Efd_min_static, Efd_max_static] = utils.matsplit(casedata.dynamicdata.exc_static(:,2:5),1);

Efd0_static=exciterInitialCondition.EFD0(casedata.dynamicdata.exc_static(:,1));
output.Efd0_static=Efd0_static;

Vref_static=Efd0_static./kA_static + lfl(casedata.dynamicdata.exc_static(:,1),2);


%% Making the variables into Struct
variableValues = {kA_static; TA_static; Efd_min_static; Efd_max_static;...
    Vref_static};

variableNames = {'kA_static'; 'TA_static'; 'Efd_min_static'; 'Efd_max_static';...
    'Vref_static'};
        
%         output = [];
        for i=1:length(variableNames)
             output = setfield(output,char(variableNames(i)),cell2mat(variableValues(i)));
        end
