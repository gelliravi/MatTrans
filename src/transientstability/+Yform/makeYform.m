function output = makeYform(casedata)
% Formation of Ybus

%% Variable declaration
gen=casedata.dynamicdata.gen;
ngen=casedata.dynamicdata.extraVariables.ngen;
nload=casedata.dynamicdata.extraVariables.nload;
ld=casedata.dynamicdata.extraVariables.ld;
nt=casedata.dynamicdata.extraVariables.nt;

%% Y formation
Y=makeYbus(casedata);

loadInitialCondition=casedata.dynamicdata.load.loadInitialCondition;
kcir1=loadInitialCondition.QL0./loadInitialCondition.VL0.^2;
kci1=loadInitialCondition.PL0./loadInitialCondition.VL0.^2;

%% Inclusion of dynamic data of both load and generators in Y
for i=1:nload
    incr=kci1(i)-j*kcir1(i);
    Y((ld(i,1)),(ld(i,1)))=Y((ld(i,1)),(ld(i,1)))+incr;
end

for i=1:ngen
    incr=1/(j*gen(i,4));
    Y((gen(i,1)),(gen(i,1)))=Y((gen(i,1)),(gen(i,1)))+incr;
end

%% An input command line interface for users to enter fault data
inputCLI = Yform.makeCLI(casedata);

Tfault = inputCLI.Tfault;
Tclear = inputCLI.Tclear;
fbus =inputCLI.fbus;
Line = inputCLI.Line;

if isempty(Tclear)
    Tclear=0;
end
if isempty(Tfault)
    Tfault=1000;
end

Yf=Y;
if ~isempty(fbus)
    Yf(fbus,fbus)=Yf(fbus,fbus)+100000;
end

Ypf=makeYbus(casedata);
%% Tripping of lines to clear fault
if ~isempty(Line)
    casedata.branch(Line,11)=0; % setting the tripped line status to 0
    Ypf=makeYbus(casedata);
    for i=1:nload
        incr=kci1(i)-j*kcir1(i);
        Ypf((ld(i,1)),(ld(i,1)))=Ypf((ld(i,1)),(ld(i,1)))+incr;
    end
    for i=1:ngen
        incr=1/(j*gen(i,4));
        Ypf((gen(i,1)),(gen(i,1)))=Ypf((gen(i,1)),(gen(i,1)))+incr;
    end
end

%% Frequency Dependancy of Load parameters:
kpf=1.5;
kqf=2;

%% Making the variables into Struct
variableValues = {kcir1; kci1; kpf; kqf;...
    Y;Tfault;Yf;Tclear;Ypf; nt; };

variableNames = {'kcir1'; 'kci1'; 'kpf'; 'kqf';...
    'Y';'Tfault';'Yf';'Tclear';'Ypf' ;'nt'; };

output = [];
for i=1:length(variableNames)
    output = setfield(output,char(variableNames(i)),cell2mat(variableValues(i)));
end

%  YnetworkSolution = ( mpc.dynamicdata.Yform.Y  * (abs(u(mpc.dynamicdata.extraVariables.nb+1))<mpc.dynamicdata.Yform.Tfault)  + mpc.dynamicdata.Yform.Yf  * (abs(u(mpc.dynamicdata.extraVariables.nb+1))>=mpc.dynamicdata.Yform.Tfault & abs(u(mpc.dynamicdata.extraVariables.nb+1)) <(mpc.dynamicdata.Yform.Tfault+mpc.dynamicdata.Yform.Tclear) ) + mpc.dynamicdata.Yform.Ypf * (abs(u(mpc.dynamicdata.extraVariables.nb+1)) >= (mpc.dynamicdata.Yform.Tfault+mpc.dynamicdata.Yform.Tclear) )  ) \   u(1:mpc.dynamicdata.extraVariables.nb);


