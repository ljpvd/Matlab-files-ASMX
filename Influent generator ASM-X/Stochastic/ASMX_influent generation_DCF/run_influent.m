% This file is used to create the BSM1_LT influent file
% first simulate the influent generator and then passes the resulting
% time series throught the primary clarifier

clc
clear

realize_DCF                     % Run the Markov Chain in order to get input for the random occurrence of DCF

ASM1_Influent_init              % Initialize states (initial values)

ASM1_Influentmodel_DCF
ASM1_Influentmodelprimary

disp(' ')
disp('Simulating the influent generator')
disp('*****************************************************************************************************************')
disp(' ')
options=simset('solver','ode45','Reltol',1e-5,'AbsTol',1e-8,'outputpoints','specified'); %Define simulation options for dynamic influent 
sim('ASM1_Influentmodel_DCF',[0:1/96:728],options); %Generate the influent file
disp('Dynamic influent generated')

Figure_ASM1_Influent

% Pass the generated influent data file through the primary settler

disp(' ')
disp('Simulating the effects of the primary settler')
disp('*****************************************************************************************************************')
disp(' ')
sim('ASM1_Influentmodelprimary',[0:1/96:609],options); % Include the effects of the primary settler
disp('Effect of the primary settler included')

Figure_BSM1LT_Influent