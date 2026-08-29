%% progetto 1

clear all
close all
clc



%% calcolo parametri

% costanti fisiche
v0 = 299.792458;                % km/ms (velocità della luce nel vuoto)
mu_0 = 0.4*pi;                  % mH/km (permeabilità del vuoto)
epsilon_0 = 1/(mu_0*v0^2);      % nF/km (costante dielettrica del vuoto)
Zv = sqrt(mu_0/epsilon_0);      % ohm (impedenza caratteristica del vuoto)

% caratteristiche dei materiali conduttori
gamma_Al = 34;                  % S m / mm^2 (conduttività elettrica a 20°C)
rho_Al = 1/gamma_Al*1000;       % ohm mm^2 / km (resistività elettrica a 20°C)
B_Al = 228;                     % °C (dipendenza dalla temperatura)

% dati della linea
Vn = [380, 220];                 % kV (tensione nominale)
fn = 50;                         % Hz (frequenza nominale)
w = 2*pi*fn;
Dab = [7.4, 9.5];                % m (distanze tra i centri delle fasi (conduttori o fasci)
Dbc = [7.4, 8.4];
Dca = [14.8, 6.1];
d = [31.5, 26.9];                % mm   (diametro dei conduttori)
n_fascio = [3, 1];               % /    (numero di conduttori per fase)
Df = [0.4, 0];                   % m    (lato del poligono del fascio, se n>1)
KL = [0.810, 0.826];             % /    (fattore per induttanza interna)
S = [519.5, 349.2];              % mm^2 (sezione di un conduttore del fascio)
theta = 50;                      % °C   (temperatura per il calcolo della resistenza)



%% parametri della linea

% distanza media (geometrica) delle fasi [m]
Dm = (Dab.*Dbc.*Dca).^(1/3);

% diametro del fascio di conduttori (se n>1) [m]
DELTA = [Df(1)/sin(pi/n_fascio(1)), 0];
    
% diametro equivalente del conduttore (induttanza) [mm]
deqL = [(n_fascio(1)*KL(1)*d(1)*(DELTA(1)*1000)^(n_fascio(1)-1))^(1/n_fascio(1)), KL(2)*d(2)];

% induttanza per unità di lunghezza [mH/km]
l = mu_0/(2*pi).*log((2*Dm*1000)./deqL);

% reattanza per unità di lunghezza [ohm/km]
x=2*pi*fn.*l/1000;

% incremento di reattanza dovuto a KL<1 [ohm/km]
DELTA_x = -mu_0*fn*(log(KL)./n_fascio)/1000;

% diametro equivalente del conduttore (capacità) [mm]
deqC = [(n_fascio(1)*d(1)*(DELTA(1)*1000)^(n_fascio(1)-1))^(1/n_fascio(1)), d(2)];

% capacità per unità di lunghezza [nF/km]
c=(2*pi*epsilon_0)./log((2*Dm*1000)./deqC)/10^-6;

% resistenza per unità di lunghezza alla temperatura theta [ohm/km]
r=(rho_Al./(n_fascio.*S)).*((B_Al+theta)/(B_Al+20));

% r, l e c per linea a 380 kV e 220 kV
r_380 = r(1);                  % [ohm/km]
r_220 = r(2);                  % [ohm/km]

l_380 = l(1)*10^-3;            % [H/km]
l_220 = l(2)*10^-3;            % [H/km]

c_380 = c(1)*10^-9;            % [F/km]
c_220 = c(2)*10^-9;            % [F/km]



%% lunghezze linee elettriche

k_lungh = 1.2;

a_1_15 = 11.9;      % Capriati - Presenzano        [km]
a_1_6 = 59.7;       % Capriati - Frattamaggiore
a_2_3 = 21.8;       % Presenzano - Garigliano
a_2_8 = 64.8;       % Presenzano - Benevento
a_15_6 = 51.2;      % Presenzano - Frattamaggiore
a_3_4 = 41.3;       % Garigliano - S. Maria
a_3_5 = 42.8;       % Garigliano - Patria
a_4_7 = 11.8;       % S. Maria - S. Sofia
a_16_6 = 20.4;      % Patria - Frattamaggiore
a_5_7 = 32.1;       % Patria - S. Sofia
a_6_17 = 13.6;      % Frattamaggiore - S. Sofia
a_6_14 = 18.5;      % Frattamaggiore - Torre
a_17_14 = 27.5;     % S. Sofia - Torre
a_17_13 = 32.9;     % S. Sofia - S. Valentino
a_7_8 = 35.3;       % S. Sofia - Benevento
a_7_9 = 40.7;       % S. Sofia - Avellino Nord
a_7_12 = 62.9;      % S. Sofia - Montecorvino
a_9_10 = 44.7;      % Avellino Nord - Bisaccia
a_11_18 = 4.5;      % Tusciano - Montecorvino
a_18_13 = 33.4;     % Montecorvino - S. Valentino
a_13_14 = 19.7;     % S. Valentino - Torre



%% valori relativi

Sb = 1000;                   % [MVA]
Vb1 = 380;                   % [kV]
Vb2 = 220;                   % [kV]

Zb_380 = Vb1^2/Sb;
Zb_220 = Vb2^2 / Sb;

Yb_380 = 1/Zb_380;
Yb_220 = 1/Zb_220;



%% dati autotrasformatori

Vn1 = 380;                   % [kV]
Vn2 = 220;                   % [kV]

t = Vn1/Vn2;                 % rapporto di trasformazione
t_pu = 1;                    % rapporto di trasformazione unitario in p.u.

Sn = 400;                    % [MVA]
Vcc = 0.14;                  % Vcc = 14 %

% impedenza ATR riferita al lato 380 kV
Z_ATR_cc = 1j*Vcc * (Vn1^2/Sn);     % [ohm] Zcc = Rcc + j*Xcc => Zcc = j*Xcc
Z_ATR_pu = Z_ATR_cc/Zb_380;         % [pu]



%% definizione della rete

% colonne: [nodo1  nodo2  livello_kV  n_circuiti  lunghezza_km]
% tipo_kV = 0 per autotrasformatore

rami = [
    1   6   220   1   k_lungh*a_1_6;
    1   15  220   1   k_lungh*a_1_15;
    2   3   380   1   k_lungh*a_2_3;
    2   8   380   1   k_lungh*a_2_8;
    2   15  0     1   0;
    3   4   380   1   k_lungh*a_3_4;
    3   5   380   1   k_lungh*a_3_5;
    4   7   380   1   k_lungh*a_4_7;
    5   7   380   1   k_lungh*a_5_7;
    5   16  0     1   0;
    6   14  220   1   k_lungh*a_6_14;
    6   17  220   2   k_lungh*a_6_17;
    6   17  220   2   k_lungh*a_6_17;
    7   8   380   1   k_lungh*a_7_8;
    7   9   380   1   k_lungh*a_7_9;
    7   12  380   1   k_lungh*a_7_12;
    7   17  0     1   0;
    9   10  380   1   k_lungh*a_9_10;
    11  18  220   1   k_lungh*a_11_18;
    12  18  0     1   0;
    13  14  220   1   k_lungh*a_13_14;  
    15  6   220   1   k_lungh*a_15_6;
    16  6   220   2   k_lungh*a_16_6;
    16  6   220   2   k_lungh*a_16_6;
    17  13  220   1   k_lungh*a_17_13;
    17  14  220   1   k_lungh*a_17_14;
    18  13  220   1   k_lungh*a_18_13
    ];

% estremi dei rami

n_nodi = 18;                    % 18 nodi di cui 9 a 380 kV e 9 a 220 kV

nodo1 = rami(:,1).';
nodo2 = rami(:,2).';
tipo_kV = rami(:,3).';
ncirc = rami(:,4).';
Lrami = rami(:,5).';

n_rami = length(nodo1);

% ammettenze dei circuiti equivalenti a pi-greco

yl12 = zeros(1,n_rami);
yt12 = zeros(1,n_rami);
yt21 = zeros(1,n_rami);

for i = 1:n_rami
    
    Li = Lrami(i);

    if tipo_kV(i) == 380
        
        z1 = (r_380 + 1j*w*l_380)/Zb_380;           % [pu/km]
        y1 = (1j*w*c_380)/Yb_380;                   % [pu/km]

        Z0_linea = sqrt(z1/y1);                     % [pu]
        gamma_linea = sqrt(z1*y1);

        ZL = Z0_linea*sinh(gamma_linea*Li);         % [pu]
        YT1 = tanh(gamma_linea*Li/2)/Z0_linea;      % [pu]
        YT2 = YT1;                                  % [pu]

        yl = 1/ZL;

    elseif tipo_kV(i) == 220
        
        z1 = (r_220 + 1j*w*l_220)/Zb_220;           % [pu/km]
        y1 = (1j*w*c_220)/Yb_220;                   % [pu/km]

        Z0_linea = sqrt(z1/y1);
        gamma_linea = sqrt(z1*y1);

        ZL = Z0_linea*sinh(gamma_linea*Li);
        YT1 = tanh(gamma_linea*Li/2)/Z0_linea;
        YT2 = YT1;
        yl = 1/ZL;

    elseif tipo_kV(i) == 0
        
        ZL = Z_ATR_pu/t_pu;
        yl = 1/ZL;

        YT1 = (1-t_pu)/Z_ATR_pu;
        YT2 = t_pu*(t_pu-1)/Z_ATR_pu;                % in p.u. le ammettenze trasversali si annullano

    else
        error('Livello di tensione non riconosciuto nel ramo %d', i)
    end

    yl12(i) = yl;
    yt12(i) = YT1;
    yt21(i) = YT2;
end



%% ammettenze trasversali dei nodi
nodo0 = [];
yt0 = [];



%% algoritmo di costruzione di Y_bus

% 1) costruzione dei nodi
Ybus = zeros(n_nodi, n_nodi);

% 2) costruzione dei rami
for i = 1:n_rami                                        % ciclo su tutti i rami
    k = nodo1(i);                                       % nodi estremi del ramo
    h = nodo2(i);
    Ybus(k,k) = Ybus(k,k) + yt12(i) + yl12(i);          % elementi sulla diagonale
    Ybus(h,h) = Ybus(h,h) + yt12(i) + yl12(i);
    Ybus(k,h) = Ybus(k,h) - yl12(i);                    % elementi fuori diagonale
    Ybus(h,k) = Ybus(h,k) - yl12(i);
end

% 3) costruzione delle ammettenze trasversali dei nodi
for i = 1:length(nodo0)                                 % ciclo sulle ammettenze yt0
    k = nodo0(i);                                       % nodo dell'ammettenza yt0
    Ybus(k,k) = Ybus(k,k) + yt0(i);                     % elemento sulla diagonale
end

figure
spy(Ybus)                                               % rappresentazione grafica
title('Struttura della Ybus')



%% costruzione Ybus sparsa

yy = [yt0, yt12+yl12, yt21+yl12, -yl12, -yl12];     % contributi additivi delle ammettenze
kk = [nodo0, nodo1, nodo2, nodo1, nodo2];           % indici di riga
ii = [nodo0, nodo1, nodo2, nodo2, nodo1];           % indici di colonna

Ybus_sp = sparse(kk,ii,yy);                         % creazione di Ybus sparsa

figure
spy(Ybus_sp)                                        % rappresentazione grafica
title('Struttura sparsa della Ybus')



%% costruzione della matrice Zbus

%  verifica invertibilità di Ybus per verificare l'esistenza di Zbus
d = det(Ybus);                  % d è diverso da 0 e quindi la matrice Ybus 
                                % è invertibile e di conseguenza esiste la Zbus

if d == 0
    error('La matrice Ybus non è invertibile, Zbus non esiste.');

else
    Zbus = inv(Ybus);           % Inversione della matrice Ybus per Zbus
    
    % Visualizzazione della matrice Zbus
    figure
    spy(Zbus)                          
    title('Struttura della Zbus')

end



%% Visualizzazione risultati

disp('Matrice Ybus (pu):');
disp(Ybus);

disp('Matrice Ybus sparsa (pu):');
disp(Ybus_sp);

disp('Matrice Zbus (pu):');
disp(Zbus);

% densità e sparsità di Ybus
n_nodi;                                 % elementi sulla diagonale della matrice
n_fuori_diag = 2*n_rami;                % elementi fuori diagonale
n_nz = n_nodi + 2*(n_rami - 2);         % numero di elementi non nulli nella matrice Ybus (di dimensione n_nodi x n_nodi).
% Il calcolo considera il numero totale di rami meno 2, poiché 2 rami sono stati aggiunti per rappresentare la doppia terna.

fprintf('Numero totale di nodi: %d\n', n_nodi);
fprintf('Numero totale di rami: %d\n', n_rami);

fprintf('Numero elementi non nulli della matrice Ybus: %d\n', n_nz);

D = 100*(n_nz/n_nodi^2);                % densità della matrice sparsa [%]
s = (100-D);                            % sparsità della matrice [%]

fprintf('Densità di Ybus: %.2f%%\n', D);
fprintf('Sparsità di Ybus: %.2f%%\n', s);