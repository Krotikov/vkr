function dhdt=odeG(t, h)

g = 9.80665;

h_l = 20;
h_r = 5;

d = 0.5;
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

dhdt = zeros(2,1);
dhdt(1) = C1 * sqrt(h(2) - h(1));
dhdt(2) = -C2* sqrt(h(2) - h(1));



