function output = case39dd
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
casedata=data.case39;

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
30	0.2	0.004	0.004	5.7	0.035625	0.19	0.19	0.19	0.5	0.05	42	0	;
31	0.295	0.0647	0.0647	6.56	0.041	0.282	0.282	0.282	1.5	0.15	30.3	0	;
32	0.2495	0.0531	0.0531	5.7	0.035625	0.237	0.237	0.237	1.5	0.15	35.8	0	;
33	0.262	0.0436	0.0436	5.69	0.03556	0.258	0.258	0.258	1.5	0.15	28.6	0	;
34	0.33	0.066	0.066	5.4	0.03375	0.31	0.31	0.31	0.44	0.044	26	0	;
35	0.254	0.05	0.05	7.3	0.045625	0.241	0.241	0.241	0.4	0.04	34.8	0	;
36	0.295	0.049	0.049	5.66	0.035375	0.292	0.292	0.292	1.5	0.15	26.4	0	;
37	0.29	0.057	0.057	6.7	0.041875	0.28	0.28	0.28	0.41	0.041	24.3	0	;
38	0.2106	0.057	0.057	4.79	0.029936	0.205	0.205	0.205	1.96	0.196	34.5	0	;
39	0.02	0.006	0.006	6	0.0375	0.019	0.019	0.019	0.7	1.07	500	0	;
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
                                        30  1	0	1	;
                                        31	1	0	1	;
                                        32	1	0	1	;
                                        33	1	0	1	;
                                        34	1	0	1	;
                                        35	1	0	1	;
                                        36	1	0	1	;
                                        37	1	0	1	;
                                        38	1	0	1	;
                                        39	1	0	2	;
];					

%-----------Main Selector for excitation systems.
%AVR = 1's (DISABLED); =0's (ENABLED)
nb=size(casedata.bus,1);
output.gen_components_Mainselector.AVR=ones(1,nb)';

% ---------------------Main Selector for Turbine models---------------
%TURB = 1's (DISABLED); =0's (ENABLED)
output.gen_components_Mainselector.TURB=ones(1,nb)'; % Turbine enabled for all buses

%---Main Selector for PSS----
%PSS = 1's (DISABLED); =0's (ENABLED)
output.gen_components_Mainselector.PSS=ones(1,nb)';

																					
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
% output.exc_DC1A=	 [																				
%     1  0.02	 20	 0.06	 1	 1	 6.0	  -6.0	  -0.0485	 0.250	 3.5461	 0.0800	 4.7281	 0.260	 0.0400	 1.000
%     2  0.02	 20	 0.06	 1	 1	 6.0	  -6.0	  -0.0633	 0.405	 0.9183	 0.6600	 1.2244	 0.880	 0.0570	 0.500
%     3  0.02	 20	 0.06	 1	 1	 6.0	  -6.0	  -0.0198	 0.500	 2.3423	 0.1300	 3.1230	 0.340	 0.0800	 1.000
%     4  0.02	 20	 0.06	 1	 1	 6.0	  -6.0	  -0.0525	 0.500	 2.8681	 0.0800	 3.8241	 0.314	 0.0800	 1.000
% ];																					
																					
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
% output.delPw_pss=	 [																				
%     1	 10	 10	 10	 10	 0.01	 10	 54	 1	 0	 0.1	 0.1	 0.05	 10	 0.1	 -0.1
%     2	 10	 10	 10	 10	 0.01	 10	 54	 1	 0	 0.1	 0.1	 0.05	 10	 0.1	 -0.1
%     3	 10	 10	 10	 10	 0.01	 10	 63	 1	 0	 0.1	 0.1	 0.05	 10	 0.1	 -0.1
%     4	 10	 10	 10	 10	 0.01	 10	 63	 1	 0	 0.1	 0.1	 0.05	 10	 0.1	 -0.1
% ];																					
		



