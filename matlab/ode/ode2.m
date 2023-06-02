function dhdt=ode2(t, h)

g = 9.80665;

h_r = 5;

d = 0.5;
s_hole = pi * (d / 2)^2;

a = 20;
b = 40;
s_bottom = a * b;

C = s_hole/s_bottom * sqrt(2*g);

dhdt = -C*sqrt(h-h_r);