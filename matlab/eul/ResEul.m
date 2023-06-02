%% Res for euler

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-3\exp\eul\x.txt", 'r');
XEU = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-3\exp\eul\rh.txt", 'r');
RHEU = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-3\exp\eul\rq.txt", 'r');
RQEU = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-3\exp\eul\num.txt", 'r');
NUMEU = fscanf(fid, '%g');

fclose all;

figure;
grid on;
loglog(XEU, RHEU, '-xr', XEU, RQEU, '-xb');
title ('Euler Exp, TurbCase');
xlabel('N');
ylabel('|u(b) - u*(b)|');
legend('rh', 'rq');

figure;
grid on;
loglog(XEU, NUMEU, '-xr');
title ('Euler Exp, TurbCase');
xlabel('N');
ylabel('M');