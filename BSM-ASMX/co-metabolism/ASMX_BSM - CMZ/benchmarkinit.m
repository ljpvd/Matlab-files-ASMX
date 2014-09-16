% clear
% clc

asm1init;
settler1dinit_asm1;
reginit_asm1;

load constinfluent;
load BSM1LT_Influent_CMZ;


DECAY = [0];        % if DECAY is 1 the decay of heterotrophs and autotrophs is depending on the electron acceptor present  
                    % if DECAY is 0 the decay do not change
SETTLER = [0];      % if SETTLER is 0 the settling model is non reactive
                    % if SETTLER IS 1 the settling model is reactive
ACTIVATE = [1];     % if ACTIVATE is 0 fate of pharmaceuticals is not included 
                    % if ACTIVATE is 1 fate of pharmaceuticals is included
TEMPMODEL =[1];     % if TEMPM0DEL is 0 influent wastewater temperature is just passed through process reactors 
                    % if TEMPMODEL is 1 mass balance for the wastewater
                    % temperature is used in process reactors  