function output = makeGenDynamicData(casedata)

nb=size(casedata.bus,1);
lfl=casedata.dynamicdata.extraVariables.lfl;

[xd, xdd, xddd, Td0d, Td0dd, xq, xqd, xqdd, Tq0d, Tq0dd, H, D]=utils.matsplit(casedata.dynamicdata.gen(:,2:13),1);

Vg0=lfl(casedata.dynamicdata.gen(:,1),2);
thetag0=pi/180*lfl(casedata.dynamicdata.gen(:,1),3);

Vg0bar=(Vg0.*cos(thetag0))+j*Vg0.*sin(thetag0);
Ig0bar=conj((lfl(casedata.dynamicdata.gen(:,1),4)+j*lfl(casedata.dynamicdata.gen(:,1),5))./Vg0bar);

Eqbar=(Vg0bar+(j*xq).*Ig0bar);
delta0=angle(Eqbar);
Eq=abs(Eqbar);

VQg0=real(Vg0bar);
VDg0=imag(Vg0bar);

Ig0bardq=Ig0bar.*(cos(delta0)-j*sin(delta0));
Vg0bardq=Vg0bar.*(cos(delta0)-j*sin(delta0));

iq0=real(Ig0bardq);
id0=imag(Ig0bardq);

iDg0=imag(Ig0bar);
iQg0=real(Ig0bar);

vqg0=real(Vg0bardq);
vdg0=imag(Vg0bardq);

siq0=-vdg0;
sid0=vqg0;
Efd0=Eq-(xd-xq).*id0;

% d-axis states
sih0=sid0;
sif0=sid0 + (xdd./(xd-xdd)).*Efd0;


% q-axis states
sig0=siq0;
sik0=siq0;

% dummy coil
Edummydd0=-(xqdd-xddd).*iq0;
Tdummy=0.01;

%field current
xfl=(xd.*xdd)./(xd-xdd);
ifd0= (sif0-sid0 )./xfl;
IFD0=ifd0.*xd;

% To determine Tdd and Tddd from Td0d and Td0dd
   a=(1- xd./xdd + xd./xddd);
   b=-(Td0d + Td0dd);
   c=(xddd./xdd).*Td0d.*Td0dd;
   Tddd1= (-b + sqrt(b.*b - 4*a.*c))./(2*a);
   Tddd2= (-b - sqrt(b.*b - 4*a.*c))./(2*a);
   Tddd= min(Tddd1,Tddd2);
   Tdd = Td0d.*Td0dd.*(xddd./xd)./Tddd;

   
% To determine Tqd and Tqdd from Tq0d and Tq0dd
   a=(1- xq./xqd + xq./xqdd);
   b=-(Tq0d + Tq0dd);
   c=(xqdd./xqd).*Tq0d.*Tq0dd;
   Tqdd1= (-b + sqrt(b.*b - 4*a.*c))./(2*a);
   Tqdd2= (-b - sqrt(b.*b - 4*a.*c))./(2*a);
   Tqdd= min(Tqdd1,Tqdd2);
   Tqd = Tq0d.*Tq0dd.*(xqdd./xq)./Tqdd;

%------------------------------------------
Eqdd0=((xdd-xddd)./xdd).*sih0 + ((xd-xdd)./xd).*(xddd./xdd).*sif0;
Eddd0=-(((xqd-xqdd)./xqd).*sik0 + ((xq-xqd)./xq).*(xqdd./xqd).*sig0);


Tm0=Eqdd0.*iq0+Eddd0.*id0+id0.*iq0.*(xddd-xqdd);




%% Making the variables into Struct
variableValues = {xd; xdd; xddd; Td0d; Td0dd; xq; xqd; xqdd; Tq0d; Tq0dd; H; D; ...
            Vg0; thetag0; Vg0bar; Ig0bar; Eqbar; ...
            delta0; Eq; VQg0; VDg0; Ig0bardq; 	Vg0bardq; ...
            iq0; id0; iDg0; iQg0; vqg0; vdg0; siq0; sid0; Efd0; ...
            sih0; sif0; sig0; sik0; Edummydd0; Tdummy; xfl; ifd0; IFD0; ...
            Tddd; Tdd; Tqdd; Tqd; Eqdd0; Eddd0; Tm0};

variableNames = {'xd', 'xdd', 'xddd', 'Td0d', 'Td0dd', 'xq', 'xqd', 'xqdd', 'Tq0d', 'Tq0dd', 'H', 'D', ...
            'Vg0', 'thetag0', 'Vg0bar', 'Ig0bar', 'Eqbar', ...
            'delta0', 'Eq', 'VQg0', 'VDg0', 'Ig0bardq', 'Vg0bardq', ...
            'iq0', 'id0', 'iDg0', 'iQg0', 'vqg0', 'vdg0', 'siq0', 'sid0', 'Efd0', ...
            'sih0', 'sif0', 'sig0', 'sik0', 'Edummydd0', 'Tdummy', 'xfl', 'ifd0', 'IFD0', ...
            'Tddd', 'Tdd', 'Tqdd', 'Tqd', 'Eqdd0', 'Eddd0', 'Tm0'};
        
        output = [];
        for i=1:length(variableNames)
             output = setfield(output,char(variableNames(i)),cell2mat(variableValues(i)));
        end

     
        
        %-------------------------------------------        
clear iq0,iQg0;
clear id0,iDg0;
clear Ig0bardq;
clear Vg0bardq;

% [mm output.order_gen]=sort([setxor(1:nb,casedata.gen(:,1)'),casedata.gen(:,1)']);
[mm output.order_gen]=sort([setxor(1:nb,casedata.dynamicdata.gen(:,1)'),casedata.dynamicdata.gen(:,1)']);


       