%% Turbulent case
g = 9.80665;

h_l = 20;
h_r = 5;

b_t = 2;
a_t = 48;
Dh = 2;
A = pi * Dh*Dh/4;
nu = 1.006e6;
L = 2 * b_t + a_t;
ro = 997;
ReT = 4000;

%q_min = A * nu * ReT / Dh;

A1 = 6.9 * A * nu / Dh;
A2 = (L * ro)/(Dh * A * A * ro * g);
h = 0.02;
S = 800;

syms q
eqn = (h_l - h_r) - 1/(1.8*log10(A1/q) * 1.8*log10(A1/q))*(q*q)*A2;
eqn1 = (h_l - h_r + h*q / S) - 1/(1.8*log10(A1/(h_r + h*q / S)) * 1.8*log10(A1/(h_r + h*q / S)))*(q*q)*A2;

q_0_sym = vpasolve(eqn1, q, 69);
q_0 = double(q_0_sym);

M = [1 0 ; 0 0];
y0 = [h_r; q_0];
tspanTurb = [0, 303];

options = odeset('Mass', M, 'RelTol',1e-7);


[t15_Turb,h15_Turb] = ode15s(@turb,tspanTurb,y0,options);

%% Get solutions

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\imp\grid200.txt", 'r');
GRIDE200 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\imp\y1_200.txt", 'r');
Y1E200 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\imp\y2_200.txt", 'r');
Y2E200 = fscanf(fid, '%g');

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\imp\grid1000.txt", 'r');
GRIDE1e3 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\imp\y1_1000.txt", 'r');
Y1E1e3 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\imp\y2_1000.txt", 'r');
Y2E1e3 = fscanf(fid, '%g');

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\imp\grid10000.txt", 'r');
GRIDE1e4 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\imp\y1_10000.txt", 'r');
Y1E1e4 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\imp\y2_10000.txt", 'r');
Y2E1e4 = fscanf(fid, '%g');

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\imp\grid100000.txt", 'r');
GRIDE1e5 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\imp\y1_100000.txt", 'r');
Y1E1e5 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\imp\y2_100000.txt", 'r');
Y2E1e5 = fscanf(fid, '%g');

fclose all;

figure;
hold on;
grid on;
plot(GRIDE200, Y1E200, '-', GRIDE200, Y2E200, '-', ...
     GRIDE1e3, Y1E1e3, ':', GRIDE1e3, Y2E1e3, ':', ...
     GRIDE1e4, Y1E1e4, '--', GRIDE1e4, Y2E1e4, '--', ...
     GRIDE1e5, Y1E1e5, '-.', GRIDE1e5, Y2E1e5, '-.');
plot(t15_Turb,h15_Turb(:, 1),'-or', t15_Turb,h15_Turb(:, 2),'-ob')
title ('Mod euler Exp, TurbCase');
xlabel('x');
ylabel('y');
legend('h, k = 200', 'q, k = 200', 'h, k = 1e3', 'q, k = 1e3', ...
        'h, k = 1e4', 'q, k = 1e4', 'h, k = 1e5', 'q, k = 1e5', ...
        'h - ode15s','q - ode15s');
