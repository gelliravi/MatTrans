function mpc = dynamicdata
% function dynamicdata
%dynamicdata is the generalized data that can be assigned to any machine.
%   This data has to be specific to a specific to a case network, which is
%   handled in dynamicdatacaseX.m
%
%   Based on data from ...
%     https://www.ee.iitb.ac.in/~anil/download/Transient_Stability_Programs/
%     

%   Created by Gelli Ravikumar in 2015, modified in 2015.
%   Distributed with permission.

%   MATPOWER
%   $Id: dynamicdata.m 2015-12-05 Gelli $

%% MATPOWER Case Format : Dynamic Data Version 1
mpc.versionDD = '1';

%% Components																					
																					
% Generator data (2.2 model)																					
%	Gen.no.	xd	xdd	xddd	Td0d	Td0dd	xq	xqd	xqdd	Tq0d	Tq0dd	H	D								
mpc.dynamicdata.gen=	 [																				
	1	0.2	0.033	0.0264	8	0.05	0.19	0.061	0.03	0.4	0.04	54	0	;							
];																					
																					
%% Exciters Data																					
% Single-time constant static type exciter.																					
%	Gen.no.	KA	TA	EFDMIN	EFDMAX																
mpc.exc_static=	 [																				
	1	200	0.02	-6	6	;															
];																					
																					
% IEEE ST1A type exciter																					
%	Gen.no.	Tr	TC	TB	KA	TA	KF	TF	VRMAX	VRMIN	KC	KLR	ILR								
mpc.exc_ST1A=	 [																				
	1	0.02	1	1	200	0.02	0	1	7	-6.4	0.04	4.54	5	;							
];																					
																					
% IEEE ST2A type exciter																					
%	Gen.no.	KA	TA	KE	TE	KC	KF	TF	VRMAX	VRMIN	KP	KI	EFDMAX								
mpc.exc_ST2A=	 [																				
	1	120	0.15	1	0.5	0.65	0.05	1	1.2	-1.2	1.19	1.62	3.55	;							
];																					
																					
% IEEE AC4A type exciter																					
%	Gen.no.	Tr	KA	TA	TC	TB	VIMAX	VIMIN	VRMIN	VRMAX	KC										
mpc.exc_AC4A=	 [																				
	1	0.02	200	0.02	1	10	10	-10	-4.53	5.64	0	;									
];																					
																					
% IEEE AC1A type exciter																					
%	Gen.no	Tr	KA	TA	TC	TB	VAMAX	VAMIN	VRMAX	VRMIN	KE	TE	E1	SE1	E2	SE2	KF	TF	KD	KC	
mpc.exc_AC1A=	 [																				
	1	0.02	100	0.02	1	1	14.5	-14.5	6.03	-5.43	1	0.8	3.14	0.03	4.18	0.1	0.03	1	0.38	0.2	;
];																					
																					
% IEEE DC1A type exciter																					
%	Gen.no.	Tr	KA	TA	TC	TB	VRMAX	VRMIN	KE	TE	E1	SE1	E2	SE2	KF	TF					
mpc.exc_DC1A=	 [																				
	1	0.02	20	0.06	1	1	6	-6	-0.0485	0.25	3.5461	0.08	4.7281	0.26	0.04	1	;				
];																					
																					
%% Turbines Data																					
% Hydro-turbine																					
%	Gen.no.	TW	TG	SIGMA	T2	PMAX_fac	PMIN_fac														
mpc.turb_hydro=	 [																				
	1	1	0.2	0.05	0	1.1	0.1	;													
];																					
																					
% Non-reheat type steam turbine																					
%	Gen.no.	TCH	SIGMA	T1	T2	T3	PMAX_fac	PMIN_fac													
mpc.turb_nrst=	 [																				
	1	0.2	0.05	0.2	0	0.1	1.1	0.1	;												
];																					
																					
% Reheat type steam turbine																					
%	Gen.no.	T1	T2	T3	SIGMA	PMAX_fac	PMIN_fac	TCH	TRH	TCO	FHP	FIP	FLP								
mpc.turb_rhst=	 [																				
	1	0.2	0	0.1	0.05	1.1	0.1	0.3	10	0.4	0.3	0.3	0.4	;							
];																					
																					
%% Power System Stabilizers (PSS) Data																					
% Slip signal based PSS																					
%	Gen.no.	KS	TR	TW	T1	T2	VSMAX	VSMIN													
mpc.slip_pss=	 [																				
	1	5	0.02	10	0.1	0.05	0.1	-0.1	;												
];																					
																					
% Power signal based PSS																					
%	Gen.no.	TW	TR	KS	VSMAX	VSMIN															
mpc.power_pss=	 [																				
	1	10	0.05	0.07	0.1	-0.1	;														
];																					
																					
% Frequency signal based PSS																					
%	Gen.no.	TW	TR	KS	T1	T2	VSMAX	VSMIN													
mpc.freq_pss=	 [																				
	1	10	0.02	5	0.1	0.05	0.1	0	;												
];																					
																					
% Delta-P-Omega signal based PSS																					
%	Gen.no.	Tw1	Tw2	Tw3	Tw4	T6	T7	H	KS3	T8	T9	T1	T2	KS1	VSMAX	VSMIN					
mpc.delPw_pss=	 [																				
	1	10	10	10	10	0.01	10	54	1	0	0.1	0.1	0.05	10	0.1	-0.1	;				
];																					
																					
