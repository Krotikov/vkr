%gateway model equation
function val=eqn(q)

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

A1 = 6.9 * A * nu / Dh;
A2 = (L * ro)/(Dh * A * A * ro * g);


val = (h_l - h_r) - 1/(1.8*log10(A1/q) * 1.8*log10(A1/q))*(q*q)*A2;