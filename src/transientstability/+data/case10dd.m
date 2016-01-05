function output = case10dd
%dynamicdatacaseX is the generalized data that can be assigned to any machine.
%   This data has to be specific to a specific to a case network, which is
%   handled in dynamicdatacaseX.m
%
%   Based on data from ...
%     https://www.ee.iitb.ac.in/~anil/download/Transient_Stability_Programs/
%     

%   Created by Gelli Ravikumar in 2015, modified in 2015.
%   Distributed with permission.

%   MATPOWER
%   $Id: dynamicdatacaseX.m 2015-12-05 Gelli $


%% read data
casedata=data.case10;

dynamicdataAbstract.dynamicdata = data.dynamicdata;

%% MATPOWER Case Format : Dynamic Data Version 1
output.versionDynamic = '1';


%% Generator dynamic data: generate automatic (default) or prepare specific case data
generatorbuses = casedata.gen(:,1);

output.gen = repmat(dynamicdataAbstract.dynamicdata.dynamicdata.gen,size(generatorbuses)); % repate rows of gendynamic for all generators
output.gen(:,1)= generatorbuses; % Replace the default generator index from 1 to the generator buses


% Generator data (2.2 model)																					
%	Gen.no.	xd	xdd	xddd	Td0d	Td0dd	xq	xqd	xqdd	Tq0d	Tq0dd	H	D								
output.gen=	 [																				
    1	  0.2000	  0.0330	  0.0264	  8.00	  0.05	  0.190	  0.061	  0.03	  0.4	  0.04	  54.000	  0;
    2	  0.2000	  0.0330	  0.0264	  8.00	  0.05	  0.190	  0.061	  0.03	  0.4	  0.04	  54.000	  0;
    3	  0.2000	  0.0330	  0.0264	  8.00	  0.05	  0.190	  0.061	  0.03	  0.4	  0.04	  63.000	  0; 
    4	  0.2000	  0.0330	  0.0264	  8.00	  0.05	  0.190	  0.061	  0.03	  0.4	  0.04	  63.000	  0;
];																					

generatorbuses = output.gen(:,1);

%% Generator data Components	
% % type_exciter	
    % none=0; 
    % ng_static = 1
    % ng_ST1A = 2
    % ng_ST2A = 3
    % ng_AC4A = 4
    % ng_AC1A = 5
    % ng_DC1A = 6	
   
% % type_turbine
    % none=0; ng_hydro = 1
    % ng_nrt = 2
    % ng_rht = 3	

% % type_pss
    % none  = 0
    % ng_slip_pss  = 1
    % ng_power_pss = 2
    % ng_freq_pss = 3
    % ng_delPw_pss = 4
    
%                           	Gen.no.	type_exciter	type_turbine	type_pss	
output.gen_components=	 [				
                                    1           2           1               0	;
                                    2           2           1               1	;
                                    3           1           3               0	;
                                    4           1           0               0	;
];					

%-----------Main Selector for excitation systems.
%AVR = 1's (DISABLED); =0's (ENABLED)
nb=size(casedata.bus,1);
output.gen_components_Mainselector.AVR=zeros(1,nb)';

% ---------------------Main Selector for Turbine models---------------
%TURB = 1's (DISABLED); =0's (ENABLED)
output.gen_components_Mainselector.TURB=zeros(1,nb)'; % Turbine enabled for all buses
output.gen_components_Mainselector.TURB(4)=1; % Turbine of gen connected bus 4 has no primemover -- Condenser

%---Main Selector for PSS----
%PSS = 1's (DISABLED); =0's (ENABLED)
output.gen_components_Mainselector.PSS=zeros(1,nb)';

																					
%% Exciters Data																					
% Single-time constant static type exciter.																					
output.exc_static = repmat(dynamicdataAbstract.dynamicdata.exc_static,size(generatorbuses)); % repate rows of gendynamic for all generators
output.exc_static(:,1)= generatorbuses; % Replace the default generator index from 1 to the generator buses
																				
% % Specific data: If it is available, then uncomment the below output.xxx
% %	Gen.no.	KA	TA	EFDMIN	EFDMAX																
% output.exc_static=	 [																				
% 	1	200	0.02	-6	6	;															
% 
% ];																					
																					
% IEEE ST1A type exciter	
output.exc_ST1A = repmat(dynamicdataAbstract.dynamicdata.exc_ST1A,size(generatorbuses)); % repate rows of gendynamic for all generators
output.exc_ST1A(:,1)= generatorbuses; % Replace the default generator index from 1 to the generator buses
																				
% % Specific data: If it is available, then uncomment the below output.xxx
% %	Gen.no.	Tr	TC	TB	KA	TA	KF	TF	VRMAX	VRMIN	KC	KLR	ILR								
% output.exc_ST1A=	 [																				
% 	1	0.02	1	1	200	0.02	0	1	7	-6.4	0.04	4.54	5	;							
% ];																					
																					
% IEEE ST2A type exciter	
output.exc_ST2A = repmat(dynamicdataAbstract.dynamicdata.exc_ST2A,size(generatorbuses)); % repate rows of gendynamic for all generators
output.exc_ST2A(:,1)= generatorbuses; % Replace the default generator index from 1 to the generator buses
																				
% % Specific data: If it is available, then uncomment the below output.xxx																	
% %	Gen.no.	KA	TA	KE	TE	KC	KF	TF	VRMAX	VRMIN	KP	KI	EFDMAX								
% output.exc_ST2A=	 [																				
% 	1	120	0.15	1	0.5	0.65	0.05	1	1.2	-1.2	1.19	1.62	3.55	;							
% ];																					
																					
% IEEE AC4A type exciter																					
output.exc_AC4A = repmat(dynamicdataAbstract.dynamicdata.exc_AC4A,size(generatorbuses)); % repate rows of gendynamic for all generators
output.exc_AC4A(:,1)= generatorbuses; % Replace the default generator index from 1 to the generator buses
																				
% % Specific data: If it is available, then uncomment the below output.xxx%	Gen.no.	Tr	KA	TA	TC	TB	VIMAX	VIMIN	VRMIN	VRMAX	KC										
% output.exc_AC4A=	 [																				
% 	1	0.02	200	0.02	1	10	10	-10	-4.53	5.64	0	;									
% ];																					
																					
% IEEE AC1A type exciter																					
output.exc_AC1A = repmat(dynamicdataAbstract.dynamicdata.exc_AC1A,size(generatorbuses)); % repate rows of gendynamic for all generators
output.exc_AC1A(:,1)= generatorbuses; % Replace the default generator index from 1 to the generator buses
																				
% % Specific data: If it is available, then uncomment the below output.xxx%	Gen.no.	Tr	KA	TA	TC	TB	VIMAX	VIMIN	VRMIN	VRMAX	KC										
% %	Gen.no	Tr	KA	TA	TC	TB	VAMAX	VAMIN	VRMAX	VRMIN	KE	TE	E1	SE1	E2	SE2	KF	TF	KD	KC	
% output.exc_AC1A=	 [																				
% 	1	0.02	100	0.02	1	1	14.5	-14.5	6.03	-5.43	1	0.8	3.14	0.03	4.18	0.1	0.03	1	0.38	0.2	;
% ];																					
																					
% IEEE DC1A type exciter																					
output.exc_DC1A = repmat(dynamicdataAbstract.dynamicdata.exc_DC1A,size(generatorbuses)); % repate rows of gendynamic for all generators
output.exc_DC1A(:,1)= generatorbuses; % Replace the default generator index from 1 to the generator buses
																				
% Specific data: If it is available, then uncomment the below output.xxx%	Gen.no.	Tr	KA	TA	TC	TB	VIMAX	VIMIN	VRMIN	VRMAX	KC										
%	Gen.no.	Tr	KA	TA	TC	TB	VRMAX	VRMIN	KE	TE	E1	SE1	E2	SE2	KF	TF					
output.exc_DC1A=	 [																				
    1  0.02	 20	 0.06	 1	 1	 6.0	  -6.0	  -0.0485	 0.250	 3.5461	 0.0800	 4.7281	 0.260	 0.0400	 1.000
    2  0.02	 20	 0.06	 1	 1	 6.0	  -6.0	  -0.0633	 0.405	 0.9183	 0.6600	 1.2244	 0.880	 0.0570	 0.500
    3  0.02	 20	 0.06	 1	 1	 6.0	  -6.0	  -0.0198	 0.500	 2.3423	 0.1300	 3.1230	 0.340	 0.0800	 1.000
    4  0.02	 20	 0.06	 1	 1	 6.0	  -6.0	  -0.0525	 0.500	 2.8681	 0.0800	 3.8241	 0.314	 0.0800	 1.000
];																					
																					
%% Turbines Data																					
% Hydro-turbine																					
output.turb_hydro = repmat(dynamicdataAbstract.dynamicdata.turb_hydro,size(generatorbuses)); % repate rows of gendynamic for all generators
output.turb_hydro(:,1)= generatorbuses; % Replace the default generator index from 1 to the generator buses
																				
% % Specific data: If it is available, then uncomment the below output.xxx%	Gen.no.	Tr	KA	TA	TC	TB	VIMAX	VIMIN	VRMIN	VRMAX	KC										
% %	Gen.no.	TW	TG	SIGMA	T2	PMAX_fac	PMIN_fac														
% output.turb_hydro=	 [																				
% 	1	1	0.2	0.05	0	1.1	0.1	;													
% ];																					
																					
% Non-reheat type steam turbine																					
output.turb_nrst = repmat(dynamicdataAbstract.dynamicdata.turb_nrst,size(generatorbuses)); % repate rows of gendynamic for all generators
output.turb_nrst(:,1)= generatorbuses; % Replace the default generator index from 1 to the generator buses
																				
% % Specific data: If it is available, then uncomment the below output.xxx%	Gen.no.	Tr	KA	TA	TC	TB	VIMAX	VIMIN	VRMIN	VRMAX	KC										
% %	Gen.no.	TCH	SIGMA	T1	T2	T3	PMAX_fac	PMIN_fac													
% output.turb_nrst=	 [																				
% 	1	0.2	0.05	0.2	0	0.1	1.1	0.1	;												
% ];																					
																					
% Reheat type steam turbine																					
output.turb_rhst = repmat(dynamicdataAbstract.dynamicdata.turb_rhst,size(generatorbuses)); % repate rows of gendynamic for all generators
output.turb_rhst(:,1)= generatorbuses; % Replace the default generator index from 1 to the generator buses
																				
% % Specific data: If it is available, then uncomment the below output.xxx%	Gen.no.	Tr	KA	TA	TC	TB	VIMAX	VIMIN	VRMIN	VRMAX	KC										
% %	Gen.no.	T1	T2	T3	SIGMA	PMAX_fac	PMIN_fac	TCH	TRH	TCO	FHP	FIP	FLP								
% output.turb_rhst=	 [																				
% 	1	0.2	0	0.1	0.05	1.1	0.1	0.3	10	0.4	0.3	0.3	0.4	;							
% ];																					
																					
%% Power System Stabilizers (PSS) Data																					
% Slip signal based PSS																					
output.slip_pss = repmat(dynamicdataAbstract.dynamicdata.slip_pss,size(generatorbuses)); % repate rows of gendynamic for all generators
output.slip_pss(:,1)= generatorbuses; % Replace the default generator index from 1 to the generator buses
																				
% % Specific data: If it is available, then uncomment the below output.xxx
% %	Gen.no.	KS	TR	TW	T1	T2	VSMAX	VSMIN													
% output.slip_pss=	 [																				
% 	1	5	0.05	10	0.1	0.05	0.1	-0.1	;												
% ];																					
																					
% Power signal based PSS																					
output.power_pss = repmat(dynamicdataAbstract.dynamicdata.power_pss,size(generatorbuses)); % repate rows of gendynamic for all generators
output.power_pss(:,1)= generatorbuses; % Replace the default generator index from 1 to the generator buses
																				
% % Specific data: If it is available, then uncomment the below output.xxx%	Gen.no.	Tr	KA	TA	TC	TB	VIMAX	VIMIN	VRMIN	VRMAX	KC										
% %	Gen.no.	TW	TR	KS	VSMAX	VSMIN															
% output.power_pss=	 [																				
% 	1	10	0.05	0.07	0.1	-0.1	;														
% ];																					
																					
% Frequency signal based PSS																					
output.freq_pss = repmat(dynamicdataAbstract.dynamicdata.freq_pss,size(generatorbuses)); % repate rows of gendynamic for all generators
output.freq_pss(:,1)= generatorbuses; % Replace the default generator index from 1 to the generator buses
																				
% % Specific data: If it is available, then uncomment the below output.xxx%	Gen.no.	Tr	KA	TA	TC	TB	VIMAX	VIMIN	VRMIN	VRMAX	KC										
% %	Gen.no.	TW	TR	KS	T1	T2	VSMAX	VSMIN													
% output.freq_pss=	 [																				
% 	1	10	0.02	5	0.1	0.05	0.1	0	;												
% ];																					
																					
% Delta-P-Omega signal based PSS																					
output.delPw_pss = repmat(dynamicdataAbstract.dynamicdata.delPw_pss,size(generatorbuses)); % repate rows of gendynamic for all generators
output.delPw_pss(:,1)= generatorbuses; % Replace the default generator index from 1 to the generator buses
																				
% Specific data: If it is available, then uncomment the below output.xxx%	Gen.no.	Tr	KA	TA	TC	TB	VIMAX	VIMIN	VRMIN	VRMAX	KC										
%	Gen.no.	Tw1	Tw2	Tw3	Tw4	T6	T7	H	KS3	T8	T9	T1	T2	KS1	VSMAX	VSMIN					
output.delPw_pss=	 [																				
    1	 10	 10	 10	 10	 0.01	 10	 54	 1	 0	 0.1	 0.1	 0.05	 10	 0.1	 -0.1
    2	 10	 10	 10	 10	 0.01	 10	 54	 1	 0	 0.1	 0.1	 0.05	 10	 0.1	 -0.1
    3	 10	 10	 10	 10	 0.01	 10	 63	 1	 0	 0.1	 0.1	 0.05	 10	 0.1	 -0.1
    4	 10	 10	 10	 10	 0.01	 10	 63	 1	 0	 0.1	 0.1	 0.05	 10	 0.1	 -0.1
];																					
		



