function output = makeCLI(casedata)
% This initiates the command line interface for the runts program, where
% users can enter the inputs such as Tfault, Tclear, Fault bus, and the
% lines ot be removed


nt=casedata.dynamicdata.extraVariables.nt;

display('If NO action to be taken, PRESS ENTER for every prompt.')

Tfault=input('Fault initiation time (s), Tfault= ');
Tclear=input('Fault Duration,(s) Tclear= ');
fbus=input('Faulted Bus: ');
%     fprintf(fd, '\n================================================================================');
%     fprintf(fd, '\n| Lines Connected to the Faulted Bus choose the lines to be tripped from its index |');
%     fprintf(fd, '\n================================================================================');
%     fprintf(fd, '\n\nLine index             from bus         to bus');
%     fprintf(fd, '\n------------------    ---------------   ----------- ');
%     fprintf(fd, '\n         %6d     Total Gen Capacity   %7.1f       %7.1f to %.1f', nb, sum(gen(allg, PMAX)), sum(gen(allg, QMIN)), sum(gen(allg, QMAX)));
if fbus
fbusConnectedLines = [find(nt(:,1)==fbus) nt(find(nt(:,1)==fbus),1:2); find(nt(:,2)==fbus) nt(find(nt(:,2)==fbus),1:2)];
fprintf('========================================');
fprintf('\n| Lines Connected to the Faulted Bus |');
fprintf('\n========================================');
fprintf('\n  Line    from   to');
fprintf('\n  index   bus    bus');
fprintf('\n  -----  ----- -----\n');
disp(fbusConnectedLines);
fprintf('========================================\n');
fprintf('** Choose the lines to be tripped from their index');
end


Line=input('\nLine(s) to be tripped, [ , ]= ');




%% Making the variables into Struct
variableValues = {Tfault; Tclear; fbus; Line; };

variableNames = {'Tfault'; 'Tclear'; 'fbus'; 'Line'; };
        
        output = [];
        for i=1:length(variableNames)
             output = setfield(output,char(variableNames(i)),cell2mat(variableValues(i)));
        end
        
%         
% fprintf('========================================');
% fprintf('\n You have entered:');
% fprintf('\n========================================');
% output;    
% fprintf('\n====Executing Transient Stability Program==========');
