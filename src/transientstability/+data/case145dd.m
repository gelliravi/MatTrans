function mpc = case145dd

%% read data
casedata=data.case145;

dynamicdataAbstract.dynamicdata = data.dynamicdata;

%% MATPOWER Case Format : Dynamic Data Version 1
mpc.versionDynamic = '1';


%% Generator dynamic data: generate automatic (default) or prepare specific case data
generatorbuses = casedata.gen(:,1);

mpc.gen = repmat(dynamicdataAbstract.dynamicdata.dynamicdata.gen,size(generatorbuses)); % repate rows of gendynamic for all generators
mpc.gen(:,1)= generatorbuses; % Replace the default generator index from 1 to the generator buses


% Generator data (2.2 model)																					
%	Gen.no.	xd	xdd	xddd	Td0d	Td0dd	xq	xqd	xqdd	Tq0d	Tq0dd	H	D								
mpc.gen=	 [																				
60	2.8684	0.4769	0.4769	10000	0.05	0.4769	0.4769	0.4769	0.4	0.04	1.41	0	;
67	0.1278	0.0213	0.0213	10000	0.05	0.0213	0.0213	0.0213	0.4	0.04	52.18	0	;
79	0.7752	0.1292	0.1292	10000	0.05	0.1292	0.1292	0.1292	0.4	0.04	6.65	0	;
80	3.9888	0.6648	0.6648	10000	0.05	0.6648	0.6648	0.6648	0.4	0.04	1.2857	0	;
82	3.1746	0.5291	0.5291	10000	0.05	0.5291	0.5291	0.5291	0.4	0.04	2.115	0	;
89	0.351	0.0585	0.0585	10000	0.05	0.0585	0.0585	0.0585	0.4	0.04	20.56	0	;
90	9.6	1.6	1.6	10000	0.05	1.6	1.6	1.6	0.4	0.04	0.7628	0	;
91	2.2308	0.3718	0.3718	10000	0.05	0.3718	0.3718	0.3718	0.4	0.04	1.6848	0	;
93	0.09842	0.024	0.024	8.5	0.05	0.09673	0.03655	0.03655	1.24	0.04	115.04	0	;
94	0.5034	0.0839	0.0839	10000	0.05	0.0839	0.0839	0.0839	0.4	0.04	17.342	0	;
95	0.9714	0.1619	0.1619	10000	0.05	0.1619	0.1619	0.1619	0.4	0.04	5.4662	0	;
96	2.8944	0.4824	0.4824	10000	0.05	0.4824	0.4824	0.4824	0.4	0.04	2.1216	0	;
97	1.275	0.2125	0.2125	10000	0.05	0.2125	0.2125	0.2125	0.4	0.04	5.4912	0	;
98	1.7	0.0795	0.0795	10000	0.05	0.0795	0.0795	0.0795	0.4	0.04	13.96	0	;
99	0.477	0.1146	0.1146	10000	0.05	0.1146	0.1146	0.1146	0.4	0.04	17.108	0	;
100	0.8376	0.1386	0.1386	10000	0.05	0.1386	0.1386	0.1386	0.4	0.04	7.56	0	;
101	0.5544	0.0924	0.0924	10000	0.05	0.0924	0.0924	0.0924	0.4	0.04	12.284	0	;
102	0.081	0.0135	0.0135	10000	0.05	0.0135	0.0135	0.0135	0.4	0.04	78.437	0	;
103	0.6378	0.1063	0.1063	10000	0.05	0.1063	0.1063	0.1063	0.4	0.04	8.16	0	;
104	0.1016	0.0122	0.0122	10	0.05	0.0982	0.0144	0.0144	1.5	0.04	73.853	0	;
105	0.1144	0.0208	0.0208	6.61	0.05	0.1092	0.03149	0.03149	1.5	0.04	84.391	0	;
106	0.17165	0.03118	0.03118	6.61	0.05	0.16377	0.0472	0.0472	1.5	0.04	56.261	0	;
108	0.1488	0.0248	0.0248	10000	0.05	0.0248	0.0248	0.0248	0.4	0.04	30.432	0	;
109	1.2174	0.2029	0.2029	10000	0.05	0.2029	0.2029	0.2029	0.4	0.04	2.6622	0	;
110	0.09842	0.024	0.024	8.5	0.05	0.09673	0.03655	0.03655	1.24	0.04	115.05	0	;
111	0.1016	0.0122	0.0122	10	0.05	0.0982	0.0144	0.0144	1.5	0.04	73.853	0	;
112	0.5544	0.0924	0.0924	10000	0.05	0.0924	0.0924	0.0924	0.4	0.04	12.284	0	;
115	0.0144	0.0024	0.0024	10000	0.05	0.0024	0.0024	0.0024	0.4	0.04	97.33	0	;
116	0.0132	0.0022	0.0022	10000	0.05	0.0022	0.0022	0.0022	0.4	0.04	105.5	0	;
117	0.0102	0.0017	0.0017	10000	0.05	0.0017	0.0017	0.0017	0.4	0.04	102.16	0	;
118	0.0084	0.0014	0.0014	10000	0.05	0.0014	0.0014	0.0014	0.4	0.04	162.74	0	;
119	0.0012	0.0002	0.0002	10000	0.05	0.0002	0.0002	0.0002	0.4	0.04	348.22	0	;
121	0.0102	0.0017	0.0017	10000	0.05	0.0017	0.0017	0.0017	0.4	0.04	116.54	0	;
122	0.0534	0.0089	0.0089	10000	0.05	0.0089	0.0089	0.0089	0.4	0.04	39.24	0	;
124	0.0102	0.0017	0.0017	10000	0.05	0.0017	0.0017	0.0017	0.4	0.04	116.86	0	;
128	0.0006	0.0001	0.0001	10000	0.05	0.0001	0.0001	0.0001	0.4	0.04	503.87	0	;
130	0.006	0.001	0.001	10000	0.05	0.001	0.001	0.001	0.4	0.04	230.9	0	;
131	0.0006	0.0001	0.0001	10000	0.05	0.0001	0.0001	0.0001	0.4	0.04	1101.7	0	;
132	0.0096	0.0016	0.0016	10000	0.05	0.0016	0.0016	0.0016	0.4	0.04	120.35	0	;
134	0.0018	0.0003	0.0003	10000	0.05	0.0003	0.0003	0.0003	0.4	0.04	802.12	0	;
135	0.0048	0.0008	0.0008	10000	0.05	0.0008	0.0008	0.0008	0.4	0.04	232.63	0	;
136	0.0006	0.0001	0.0001	10000	0.05	0.0001	0.0001	0.0001	0.4	0.04	2018.2	0	;
137	0.0024	0.0004	0.0004	10000	0.05	0.0004	0.0004	0.0004	0.4	0.04	469.32	0	;
139	0.0006	0.0001	0.0001	10000	0.05	0.0001	0.0001	0.0001	0.4	0.04	2210.2	0	;
140	0.0018	0.0003	0.0003	10000	0.05	0.0003	0.0003	0.0003	0.4	0.04	899.19	0	;
141	0.0006	0.0001	0.0001	10000	0.05	0.0001	0.0001	0.0001	0.4	0.04	1474.2	0	;
142	0.0018	0.0003	0.0003	10000	0.05	0.0003	0.0003	0.0003	0.4	0.04	950.8	0	;
143	0.0138	0.0023	0.0023	10000	0.05	0.0023	0.0023	0.0023	0.4	0.04	204.3	0	;
144	0.0024	0.0004	0.0004	10000	0.05	0.0004	0.0004	0.0004	0.4	0.04	443.22	0	;
145	0.0108	0.0018	0.0018	10000	0.05	0.0018	0.0018	0.0018	0.4	0.04	518.08	0	;
];																					


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
mpc.gen_components=	 [				
                                    93           4          0              0	;
                                    104          4          0              0	;
                                    105          4          0              0	;
                                    106          4          0              0	;
                                    110          4          0              0	;
                                    111          4          0              0	;
];					

%-----------Main Selector for excitation systems.
%AVR = 1's (DISABLED); =0's (ENABLED)
nb=size(casedata.bus,1);
mpc.gen_components_Mainselector.AVR=ones(1,nb)';
mpc.gen_components_Mainselector.AVR([93,104,105,106,110,111])=0;

% ---------------------Main Selector for Turbine models---------------
%TURB = 1's (DISABLED); =0's (ENABLED)
mpc.gen_components_Mainselector.TURB=ones(1,nb)'; % Turbine enabled for all buses

%---Main Selector for PSS----
%PSS = 1's (DISABLED); =0's (ENABLED)
mpc.gen_components_Mainselector.PSS=ones(1,nb)';

																					
%% Exciters Data																					
% Single-time constant static type exciter.																					
mpc.exc_static = repmat(dynamicdataAbstract.dynamicdata.exc_static,size(generatorbuses)); % repate rows of gendynamic for all generators
mpc.exc_static(:,1)= generatorbuses; % Replace the default generator index from 1 to the generator buses
																				
% % Specific data: If it is available, then uncomment the below mpc.xxx
% %	Gen.no.	KA	TA	EFDMIN	EFDMAX																
mpc.exc_static=	 [																				
	60	200	0.02	-6	6	;															
];																					
																					
% IEEE ST1A type exciter	
mpc.exc_ST1A = repmat(dynamicdataAbstract.dynamicdata.exc_ST1A,size(generatorbuses)); % repate rows of gendynamic for all generators
mpc.exc_ST1A(:,1)= generatorbuses; % Replace the default generator index from 1 to the generator buses
																				
% % Specific data: If it is available, then uncomment the below mpc.xxx
% %	Gen.no.	Tr	TC	TB	KA	TA	KF	TF	VRMAX	VRMIN	KC	KLR	ILR								
mpc.exc_ST1A=	 [																				
	60	0.02	1	1	200	0.02	0	1	7	-6.4	0.04	4.54	5	;							
];																					
																					
% IEEE ST2A type exciter	
mpc.exc_ST2A = repmat(dynamicdataAbstract.dynamicdata.exc_ST2A,size(generatorbuses)); % repate rows of gendynamic for all generators
mpc.exc_ST2A(:,1)= generatorbuses; % Replace the default generator index from 1 to the generator buses
																				
% % Specific data: If it is available, then uncomment the below mpc.xxx																	
% %	Gen.no.	KA	TA	KE	TE	KC	KF	TF	VRMAX	VRMIN	KP	KI	EFDMAX								
mpc.exc_ST2A=	 [																				
	60	120	0.15	1	0.5	0.65	0.05	1	4.2	-4.2	1.19	1.62	3.55	;							
];																					
																					
% IEEE AC4A type exciter																					
mpc.exc_AC4A = repmat(dynamicdataAbstract.dynamicdata.exc_AC4A,size(generatorbuses)); % repate rows of gendynamic for all generators
mpc.exc_AC4A(:,1)= generatorbuses; % Replace the default generator index from 1 to the generator buses
																				
% % Specific data: If it is available, then uncomment the below mpc.xxx%	Gen.no.	Tr	KA	TA	TC	TB	VIMAX	VIMIN	VRMIN	VRMAX	KC										
mpc.exc_AC4A=	 [																				
    93	 0.02	 185.00	 0.020	 1.0	 1.0	 1000	 -1000	 -2.00	 8.89	 0 
    104	 0.02	 253.00	 0.015	 1.0	 1.0	 1000	 -1000	 -7.00	 8.86	 0
    105	 0.02	  54.63	 0.468	 1.0	 1.0	 1000	 -1000	  0.00	 7.38	 0
    106	 0.02	  54.63	 0.468	 1.0	 1.0	 1000	 -1000	  0.00	 7.38	 0
    110	 0.02	 185.00	 0.020	 1.0	 1.0	 1000	 -1000	 -2.00	 8.89	 0
    111	 0.02	 253.00	 0.015	 1.0	 1.0	 1000	 -1000	 -7.00	 8.86	 0
];																					
																					
% IEEE AC1A type exciter																					
mpc.exc_AC1A = repmat(dynamicdataAbstract.dynamicdata.exc_AC1A,size(generatorbuses)); % repate rows of gendynamic for all generators
mpc.exc_AC1A(:,1)= generatorbuses; % Replace the default generator index from 1 to the generator buses
																				
% % Specific data: If it is available, then uncomment the below mpc.xxx%	Gen.no.	Tr	KA	TA	TC	TB	VIMAX	VIMIN	VRMIN	VRMAX	KC										
% %	Gen.no	Tr	KA	TA	TC	TB	VAMAX	VAMIN	VRMAX	VRMIN	KE	TE	E1	SE1	E2	SE2	KF	TF	KD	KC	
mpc.exc_AC1A=	 [																				
	60	0.02	100	0.02	1	1	14.5	-14.5	6.03	-5.43	1	0.8	3.14	0.03	4.18	0.1	0.03	1	0.38	0.2	;
];																					
																					
% IEEE DC1A type exciter																					
mpc.exc_DC1A = repmat(dynamicdataAbstract.dynamicdata.exc_DC1A,size(generatorbuses)); % repate rows of gendynamic for all generators
mpc.exc_DC1A(:,1)= generatorbuses; % Replace the default generator index from 1 to the generator buses
																				
% Specific data: If it is available, then uncomment the below mpc.xxx%	Gen.no.	Tr	KA	TA	TC	TB	VIMAX	VIMIN	VRMIN	VRMAX	KC										
%	Gen.no.	Tr	KA	TA	TC	TB	VRMAX	VRMIN	KE	TE	E1	SE1	E2	SE2	KF	TF					
mpc.exc_DC1A=	 [																				
    60  0.02	 20	 0.06	 1	 1	 6.0	  -6.0	  -0.0485	 0.250	 3.5461	 0.0800	 4.7281	 0.260	 0.0400	 1.000
];																					
																					
%% Turbines Data																					
% Hydro-turbine																					
mpc.turb_hydro = repmat(dynamicdataAbstract.dynamicdata.turb_hydro,size(generatorbuses)); % repate rows of gendynamic for all generators
mpc.turb_hydro(:,1)= generatorbuses; % Replace the default generator index from 1 to the generator buses
																				
% % Specific data: If it is available, then uncomment the below mpc.xxx%	Gen.no.	Tr	KA	TA	TC	TB	VIMAX	VIMIN	VRMIN	VRMAX	KC										
% %	Gen.no.	TW	TG	SIGMA	T2	PMAX_fac	PMIN_fac														
% mpc.turb_hydro=	 [																				
% 	1	1	0.2	0.05	0	1.1	0.1	;													
% ];																					
																					
% Non-reheat type steam turbine																					
mpc.turb_nrst = repmat(dynamicdataAbstract.dynamicdata.turb_nrst,size(generatorbuses)); % repate rows of gendynamic for all generators
mpc.turb_nrst(:,1)= generatorbuses; % Replace the default generator index from 1 to the generator buses
																				
% % Specific data: If it is available, then uncomment the below mpc.xxx%	Gen.no.	Tr	KA	TA	TC	TB	VIMAX	VIMIN	VRMIN	VRMAX	KC										
% %	Gen.no.	TCH	SIGMA	T1	T2	T3	PMAX_fac	PMIN_fac													
% mpc.turb_nrst=	 [																				
% 	1	0.2	0.05	0.2	0	0.1	1.1	0.1	;												
% ];																					
																					
% Reheat type steam turbine																					
mpc.turb_rhst = repmat(dynamicdataAbstract.dynamicdata.turb_rhst,size(generatorbuses)); % repate rows of gendynamic for all generators
mpc.turb_rhst(:,1)= generatorbuses; % Replace the default generator index from 1 to the generator buses
																				
% % Specific data: If it is available, then uncomment the below mpc.xxx%	Gen.no.	Tr	KA	TA	TC	TB	VIMAX	VIMIN	VRMIN	VRMAX	KC										
% %	Gen.no.	T1	T2	T3	SIGMA	PMAX_fac	PMIN_fac	TCH	TRH	TCO	FHP	FIP	FLP								
% mpc.turb_rhst=	 [																				
% 	1	0.2	0	0.1	0.05	1.1	0.1	0.3	10	0.4	0.3	0.3	0.4	;							
% ];																					
																					
%% Power System Stabilizers (PSS) Data																					
% Slip signal based PSS																					
mpc.slip_pss = repmat(dynamicdataAbstract.dynamicdata.slip_pss,size(generatorbuses)); % repate rows of gendynamic for all generators
mpc.slip_pss(:,1)= generatorbuses; % Replace the default generator index from 1 to the generator buses
																				
% % Specific data: If it is available, then uncomment the below mpc.xxx
% %	Gen.no.	KS	TR	TW	T1	T2	VSMAX	VSMIN													
% mpc.slip_pss=	 [																				
% 	1	5	0.05	10	0.1	0.05	0.1	-0.1	;												
% ];																					
																					
% Power signal based PSS																					
mpc.power_pss = repmat(dynamicdataAbstract.dynamicdata.power_pss,size(generatorbuses)); % repate rows of gendynamic for all generators
mpc.power_pss(:,1)= generatorbuses; % Replace the default generator index from 1 to the generator buses
																				
% % Specific data: If it is available, then uncomment the below mpc.xxx%	Gen.no.	Tr	KA	TA	TC	TB	VIMAX	VIMIN	VRMIN	VRMAX	KC										
% %	Gen.no.	TW	TR	KS	VSMAX	VSMIN															
% mpc.power_pss=	 [																				
% 	1	10	0.05	0.07	0.1	-0.1	;														
% ];																					
																					
% Frequency signal based PSS																					
mpc.freq_pss = repmat(dynamicdataAbstract.dynamicdata.freq_pss,size(generatorbuses)); % repate rows of gendynamic for all generators
mpc.freq_pss(:,1)= generatorbuses; % Replace the default generator index from 1 to the generator buses
																				
% % Specific data: If it is available, then uncomment the below mpc.xxx%	Gen.no.	Tr	KA	TA	TC	TB	VIMAX	VIMIN	VRMIN	VRMAX	KC										
% %	Gen.no.	TW	TR	KS	T1	T2	VSMAX	VSMIN													
% mpc.freq_pss=	 [																				
% 	1	10	0.02	5	0.1	0.05	0.1	0	;												
% ];																					
																					
% Delta-P-Omega signal based PSS																					
mpc.delPw_pss = repmat(dynamicdataAbstract.dynamicdata.delPw_pss,size(generatorbuses)); % repate rows of gendynamic for all generators
mpc.delPw_pss(:,1)= generatorbuses; % Replace the default generator index from 1 to the generator buses
																				
% Specific data: If it is available, then uncomment the below mpc.xxx%	Gen.no.	Tr	KA	TA	TC	TB	VIMAX	VIMIN	VRMIN	VRMAX	KC										
%	Gen.no.	Tw1	Tw2	Tw3	Tw4	T6	T7	H	KS3	T8	T9	T1	T2	KS1	VSMAX	VSMIN					
% mpc.delPw_pss=	 [																				
%     1	 10	 10	 10	 10	 0.01	 10	 54	 1	 0	 0.1	 0.1	 0.05	 10	 0.1	 -0.1
%     2	 10	 10	 10	 10	 0.01	 10	 54	 1	 0	 0.1	 0.1	 0.05	 10	 0.1	 -0.1
%     3	 10	 10	 10	 10	 0.01	 10	 63	 1	 0	 0.1	 0.1	 0.05	 10	 0.1	 -0.1
%     4	 10	 10	 10	 10	 0.01	 10	 63	 1	 0	 0.1	 0.1	 0.05	 10	 0.1	 -0.1
% ];																					
% 		



