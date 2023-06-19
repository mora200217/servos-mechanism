%% diseño de controlador servomecanismos 
tau = 38.5e-3; 
Km = 46.27/(138 - 38.5);

G = zpk([],[0, -1/tau], Km/tau); 

% Diseño rlocus 
K = 1/(4 * tau * Km); 

T = feedback(K*G, 1);
step(T)

%% Total de 210 puntos 
pts = 210;    % cantidad de puntos por la trayectoria
Ttotal = 12; 
Tpt = Ttotal / pts;

bode(T); 
s = tf('s'); 
C = (s + 3 *  1/tau); 


figure(); 
rlocus(1.52 * C * K * G); 
figure();
bode(C * K * G); title("Lazo abierto")
figure(); 
Tc = feedback(C * K * G, 1); 
U = feedback()
hold on; 
bode(Tc)
hold off; 
figure(); 
step(T, Tc); 
xline(Tpt); 
%% Revision 
C = K; 
Tu = feedback(K, G); step(0.03 * Tu); title("Accion de control"); 
figure()
T = feedback(K*G, 1); step(0.03 * T); title("Seguimiento"); 

%% Discretizacion en arduino 
Cdiscrete = c2d(K, 2.5e-3, 'tustin')


