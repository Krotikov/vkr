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

syms q
eqn = (h_l - h_r) - 1/(1.8*log10(A1/q) * 1.8*log10(A1/q))*(q*q)*A2;
eqn1 = log10(q);

q_0_sym = vpasolve(eqn, q, 69);
q_0 = double(q_0_sym);

M = [1 0 ; 0 0];
y0 = [h_r; q_0];
tspanTurb = [0, 303];

options = odeset('Mass',M);


[t15_Turb,h15_Turb] = ode15s(@turb,tspanTurb,y0,options);

figure;
grid on;
hold on;
plot(t15_Turb,h15_Turb(:, 1),'-or', t15_Turb,h15_Turb(:, 2),'-ob')
title ('Turbulent case');
legend('h - ode15s','q - ode15s');
xlabel('t');
ylabel('h');


%% Graphs for check euler method

%Explicit
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-1\exp\grid.txt", 'r');
GRIDE = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-1\exp\y1.txt", 'r');
Y1E = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-1\exp\y2.txt", 'r');
Y2E = fscanf(fid, '%g');

%Implicit
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-1\imp\grid.txt", 'r');
GRIDI = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-1\imp\y1.txt", 'r');
Y1I = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-1\imp\y2.txt", 'r');
Y2I = fscanf(fid, '%g');

fclose all;

%% Analytical
syms x;
y1 = exp(5*x/2);
y2 = exp(5*x/2) / 2;

%Span
xspan= [0 2];

%% Graphs for example

figure;
hold on;
grid on;
fplot(y1, xspan, 'o');
fplot(y2, xspan, 'o');
%semilogy(GRIDE, Y1E, '-r', GRIDE, Y2E, '-b');
plot(GRIDE, Y1E, '-m', GRIDE, Y2E, '-k');
title ('Euler Exp');
xlabel('x');
ylabel('y');
legend('y1-an', 'y2-an', 'y2-euler', 'y2-euler');

figure;
hold on;
grid on;
fplot(y1, xspan, 'o');
fplot(y2, xspan, 'o');
%semilogy(GRIDI, Y1I, '-r', GRIDI, Y2I, '-b');
plot(GRIDI, Y1I, '-m', GRIDI, Y2I, '-k');
title ('Euler Imp');
xlabel('x');
ylabel('y');
legend('y1-an', 'y2-an', 'y2-euler', 'y2-euler');


%% Graphs for turb

%Explicit
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-2\exp\grid.txt", 'r');
GRIDET = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-2\exp\y1.txt", 'r');
Y1ET = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-2\exp\y2.txt", 'r');
Y2ET = fscanf(fid, '%g');


%% Graphs

figure;
hold on;
grid on;
%semilogy(GRIDET, Y1ET, '-r', GRIDET, Y2ET, '-b');
plot(GRIDET, Y1ET, '-m', GRIDET, Y2ET, '-k');
plot(t15_Turb,h15_Turb(:, 1),'-or', t15_Turb,h15_Turb(:, 2),'-ob')
title ('Euler Exp, TurbCase');
xlabel('x');
ylabel('y');
legend('h-euler', 'q-euler', 'h - ode15s','q - ode15s');
