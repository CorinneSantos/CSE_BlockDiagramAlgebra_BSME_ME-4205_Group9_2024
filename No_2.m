%Clear
clear
clc
close all


%% Define G1, G2, G3, H1, H2, AND H3
G1_num = [1];
G1_den = [1 0 0];

G2_num = [1];
G2_den = [1 1];

G3_num = [1];
G3_den = [1 0];

G4_num = [1];
G4_den = [2 0];

H1_num = [1];
H1_den = [1 0];

H2_num = [1];
H2_den = [1 -1];

H3_num = [1];
H3_den = [1 -2];

%% Reduce Block Diagrams

%% For Transfer Function 1
G3G4_num = conv(G3_num,G4_num);
G3G4_den = conv(G3_den,G4_den);

G3G4H3_num =  conv(G3G4_num,H3_num);
G3G4H3_den =  conv(G3G4_den,H3_den);

G3G4H3_den_sum = [2 -4 0 1];

TF1_num = conv(G3_num,G3G4H3_den);
TF1_den = conv(G3_den,G3G4H3_den_sum);
TF1 = tf(TF1_num,TF1_den)


%% For Transfer Function 2
G2G3_num = conv(G2_num,G3_num);
G2G3_den = conv(G2_den,G3_den);

G2G3H2_num = conv(G2G3_num,H2_num);
G2G3H2_den = conv(G2G3_den,H2_den);

G2G3H2_den_sum = [2 -4 -2 7 -4 -1 0];

TF2_num = conv(G3G4H3_den,G2G3H2_den);
TF2_den = conv(G2G3_den,G2G3H2_den_sum);
TF2 = tf(TF2_num,TF2_den)

%% For Transfer Function 3
G1G4_num = conv(G1_num,G4_num);
G1G4_den = conv(G1_den,G4_den);

G1G2G3G4_num = conv(G1G4_num,G2G3_num);
G1G2G3G4_den = conv(G1G4_den,G2G3_den);

G1G2G3G4H1_num = conv(G1G2G3G4_num,H1_num);
G1G2G3G4H1_den = conv(G1G2G3G4_den,H1_den);

G1G2G3G4H1_den_sum = [4 -4 -12 12 6 -10 0 -4 -2 4 0 0 0];

TF3_num = conv(TF2_num,G1G2G3G4H1_den);
TF3_den = conv(G1G2G3G4_den,G1G2G3G4H1_den_sum);
TF3 = tf(TF3_num,TF3_den)

%step response
step(TF3,0:0.1:20)

figure

