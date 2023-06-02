%% Constants
g = 9.80665;

h_l = 20;
h_r = 5;

d = 2.4;
s_hole = pi * (d / 2)^2;

a_1 = 20;
b_1 = 40;
s_bottom1 = a_1 * b_1;

a_2 = 30;
b_2 = 60;
s_bottom2 = a_2 * b_2;

C1 = Sg/s_bottom1 ;
C2 = Sg/s_bottom2 ;

C = C1 + C2;

h_m = (s_bottom2 * h_l + s_bottom1*h_r)/(s_bottom1 + s_bottom2);

a1 = -C1 * C / 4;
b1 = C1*sqrt(h_l - h_r);

a2 = C2 * C / 4;
b2 = -C2*sqrt(h_l - h_r);

rg = 2* sqrt(h_l - h_r)/C;

q_zero = sqrt(2*g*(h_l - h_r)) * s_hole;

q_new = sqrt(g / 2) * (-C1 * 7120 + 2*sqrt(h_l - h_r))* s_hole;


%% func normal
syms t;
funcH = h_l - ((-C1 * t + 2*sqrt(h_l - h_r))^2)/4;
funcQ = sqrt(g / 2) * (-C1 * t + 2*sqrt(h_l - h_r))* s_hole;
l = 0;
r =  2* sqrt(h_l - h_r)/C1;
rch = 303;

%% Conditions for ode
tspanS = [l rch];
h10 = h_r;

%% Solve ODE for 1 case
[t15_1,h15_1] = ode15s(@ode1, tspanS, h10);
q15_1 = Sg * sqrt(h_l - h15_1);

%% Open files

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\eul\grid50.txt", 'r');
GRIDE50 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\eul\y1_50.txt", 'r');
Y1E50 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\eul\y2_50.txt", 'r');
Y2E50 = fscanf(fid, '%g');

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\meu\grid50.txt", 'r');
GRIDM50 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\meu\y1_50.txt", 'r');
Y1M50 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\meu\y2_50.txt", 'r');
Y2M50 = fscanf(fid, '%g');

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\rk\grid50.txt", 'r');
GRIDR50 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\rk\y1_50.txt", 'r');
Y1R50 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\rk\y2_50.txt", 'r');
Y2R50 = fscanf(fid, '%g');

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\ad\grid50.txt", 'r');
GRIDA50 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\ad\y1_50.txt", 'r');
Y1A50 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\ad\y2_50.txt", 'r');
Y2A50 = fscanf(fid, '%g');

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\imp\grid50.txt", 'r');
GRIDI50 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\imp\y1_50.txt", 'r');
Y1I50 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\imp\y2_50.txt", 'r');
Y2I50 = fscanf(fid, '%g');

fclose all;


%% Graphs for simple case

%first case

figure;
hold on;
fplot(funcH, tspanS);
plot(GRIDE50, Y1E50, '-', ...
     GRIDM50, Y1M50, '-.', ...
     GRIDR50, Y1R50, '--', ...
     GRIDA50, Y1A50, '-', ...
     GRIDI50, Y1I50, '.');
grid on;
colororder(["#4c4142";"#f9c80e";"#dc0d55";"#009969";"#662e9b";"#43bccd"]);
title ('Решение h для сетки N = 50');
legend('Аналитическое', 'Эйлер', ...
       'Мод. Эйлер', 'Р-К 3(1/2)', ...
       'Адамс 3', 'Неявный Эйлер');
xlabel('t');
ylabel('h');

figure;
hold on;
fplot(funcQ, tspanS);
plot(GRIDE50, Y2E50, '-', ...
     GRIDM50, Y2M50, '-.', ...
     GRIDR50, Y2R50, '--', ...
     GRIDA50, Y2A50, '-', ...
     GRIDI50, Y2I50, '.');
grid on;
colororder(["#4c4142";"#f9c80e";"#dc0d55";"#009969";"#662e9b";"#43bccd"]);
title ('Решение q для сетки N = 50');
legend('Аналитическое', 'Эйлер', ...
       'Мод. Эйлер', 'Р-К 3(1/2)', ...
       'Адамс 3', 'Неявный Эйлер');
xlabel('t');
ylabel('q');