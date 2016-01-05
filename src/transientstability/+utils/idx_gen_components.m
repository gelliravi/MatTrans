function [NG_STATIC, NG_ST1A, NG_ST2A, NG_AC4A, NG_AC1A, NG_DC1A, ...
    NG_HYDRO, NG_NRT, NG_RHT, ...
    NG_SLIP_PSS, NG_POWER_PSS, NG_FREQ_PSS, NG_DELPW_PSS] = idx_gen_components

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

%% define the indices
NONE=0;
% % type_exciter
NG_STATIC = 1;
NG_ST1A = 2;
NG_ST2A = 3;
NG_AC4A = 4;
NG_AC1A = 5;
NG_DC1A = 6;

% % type_turbine
NG_HYDRO = 1;
NG_NRT = 2;
NG_RHT = 3;

% % type_pss
NG_SLIP_PSS  = 1;
NG_POWER_PSS = 2;
NG_FREQ_PSS = 3;
NG_DELPW_PSS = 4;


