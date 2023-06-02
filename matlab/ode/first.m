%% Init const 
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

Sg = s_hole* sqrt(2*g);

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


%% func normal
syms t;
funct1 = h_l - ((-C1 * t + 2*sqrt(h_l - h_r))^2)/4;
funct2 = ((-C1 * t + 2*sqrt(h_l - h_r))^2)/4 + h_r;
l = 0;
r =  2* sqrt(h_l - h_r)/C1;

%% func for hard case
syms x;
functx1 = a1*x^2 + b1*x + h_r ;
functx2 = a2*x^2 + b2*x + h_l ;
functh_m = h_m;

%% Conditions for ode
tspanS = [l r];
h10 = h_r;
h20 = h_l;

%% Solve ODE for 1 case
[t15_1,h15_1] = ode15s(@ode1, tspanS, h10);

[t23_1,h23_1] = ode23s(@ode1, tspanS, h10);

%% Solve ODE for 2 case

[t15_2,h15_2] = ode15s(@ode2, tspanS, h20);

[t23_2,h23_2] = ode23s(@ode2, tspanS, h20);

%% Solve ode for general case
tG = [l rg];
y0 = [h_r h_l];
[t15_g,h15_g] = ode15s(@(t,y) odeG(t,y), tG, y0);


%% Graphs for simple case

%first case

figure;
grid on;
hold on;
fplot(funct1, tspanS);
plot(t15_1,h15_1,'-or')
plot(t23_1,h23_1,'-ob')
title ('1 case solution');
legend('Analytical', 'ode15s', 'ode23s');
xlabel('t');
ylabel('h');

%second case

figure;
grid on;
hold on;
fplot(funct2, tspanS);
plot(t15_2,h15_2,'-or')
plot(t23_2,h23_2,'-ob')
title ('1 case solution');
legend('Analytical', 'ode15s', 'ode23s');
xlabel('t');
ylabel('h');

%% Graphs for general case

figure;
grid on;
hold on;
fplot(functx1, tG);
fplot(functh_m, tG);
fplot(functx2, tG);
plot(t15_g,h15_g,'-om')
title ('General case');
legend('h_i', 'h_m', 'h_{i+1}', 'ode15s');
xlabel('t');
ylabel('h');