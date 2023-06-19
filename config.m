%% Cargar los datos de simulacion 
clc; 
addpath("design/", "data/", "assets/"); 
load("data/profiles.mat")  % Cargar los perfiles de posición.

%% datos de caracterización
tau = 38.5e-3; 
Km = 46.27/(138 - 38.5);

%% Disp
disp("Cargados los datos!"); 
open("mechanism_simulation"); 


