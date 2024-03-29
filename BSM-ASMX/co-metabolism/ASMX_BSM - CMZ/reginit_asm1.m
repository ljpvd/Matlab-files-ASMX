% Default carbon addition to AS reactors
carb1 = 0; % external carbon flow rate to reactor 1
carb2 = 0; % external carbon flow rate to reactor 2
carb3 = 0; % external carbon flow rate to reactor 3
carb4 = 0; % external carbon flow rate to reactor 4
carb5 = 0; % external carbon flow rate to reactor 5

CARBONSOURCECONC = 400000; % external carbon source concentration = 400000 mg COD/l

% Default KLa values for AS reactors
KLa1 = 0;
KLa2 = 0;
KLa3 = 240;
KLa4 = 240;
KLa5 = 240;

T = 0.0001; % used by hydraulic delays

% initiates parameters for all controllers in use
% this file works together with sensorinit.m
%continuous PI O2-controller
KSO5 = 25;       %Amplification, 500 in BSM1 book
TiSO5 = 0.002;   %I-part time constant (d = 2.88 min)), integral time constant, 0.001 in BSM1 book
TtSO5 = 0.001;   %Antiwindup time constant (d), tracking time constant, 0.0002 in BSM1 book
SO5intstate = 0; %initial value of I-part
SO5awstate = 0;  %initial value of antiwindup I-part
SO5ref = 1;      %setpoint for controller, mg (-COD)/l
KLa5offset = 144; %reasonable offset value for control around SO5ref
                  % = controller output if the rest is turned off, (1/d)
useantiwindupSO5 = 1;  %0=no antiwindup, 1=use antiwindup for oxygen control

%continuous PI Qintr-controller
KQintr = 10000;    %Amplification
TiQintr = 0.025;   %I-part time constant (d = 36 min), integral time constant, 0.05 in BSM1 book
TtQintr = 0.015;   %Antiwindup time constant (d), tracking time constant, 0.03 in BSM1 book
Qintrintstate = 0; %initial value of I-part
Qintrawstate = 0;  %initial value of antiwindup I-part
SNO2ref = 1;       %setpoint for controller
Qintroffset = 18500; %reasonable offset value for control around SNO2ref
                     % = controller output if the rest is turned off, m3/d
useantiwindupQintr = 1;  %0=no antiwindup, 1=use antiwindup for Qintr control
% feed forward part has not been tested or tuned for updated BSM1, use with care

Kfeedforward = 0;  %1.2 Amp. for feedforward of Qin to Qintr (0=off)
		           %K=Kfeedforward*(SNOref/(SNOref+1))*(Qffref*Qin0-55338)
Qffref = 3;

QintrT = 0.01;

%continuous PI TSS5-controller
KTSS5 = -0.5; %Amplification
TiTSS5 = 7;   %I-part time constant, integral time constant
TtTSS5 = 7;  %Antiwindup time constant, tracking time constant
TSS5set = 3200;  %TSS5 set-point for T > 15deg C
TSS5set1 = 4800;  %TSS5 set-point for T <= 15deg C
Qwintstate = 0;    %initial value of I-part
Qwawstate = 0;  %initial value of antiwindup I-part
useantiwindupTSS5 = 1; %0=no antiwindup, 1=use antiwindup for TSS control
TSS5delayinit = 3800; %Initial value of the TSS5 sensor
TfiltTSS5 = 1; %Time constant of the TSS5 filter
TSS5init = 3800; %Initial value of the TSS5 filter
TfiltT = 7; %Time constant of the wastewater temperature filter
Tinit = 15; %Initial value of the wastewater temperature filte


% to be used for a Qintr controller of BSM1 type, should then be
% sensorinit_bsm2 since it is an rudimentary 'actuator model' similar to QwT
QintrT = T*10;
QcarbT = T*10;
QwT = T*10;