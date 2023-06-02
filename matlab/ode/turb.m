function out = turb(t,y)
g = 9.80665;

h_l = 20;

a_1 = 20;
b_1 = 40;
s_bottom1 = a_1 * b_1;

b_t = 2;
a_t = 48;
Dh = 2;
A = pi * Dh*Dh/4;
nu = 1.006e6;
L = 2 * b_t + a_t;
ro = 997;

A1 = 6.9 * A * nu / Dh;
A2 = (L * ro)/(Dh * A * A * ro * g);


out = [y(2)/s_bottom1
       h_l - ((1.8*log10(A1/y(2)))^(-2)*(y(2).^2)*A2 + y(1)) ];