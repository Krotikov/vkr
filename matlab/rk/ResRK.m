%% Res for euler

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-3\exp\rk\x.txt", 'r');
XEU = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-3\exp\rk\rh.txt", 'r');
RHEU = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-3\exp\rk\rq.txt", 'r');
RQEU = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-3\exp\rk\num.txt", 'r');
NUMEU = fscanf(fid, '%g');

fclose all;

figure;
grid on;
loglog(XEU, RHEU, '-xr', XEU, RQEU, '-xb');
title ('Runge 3rd Exp, TurbCase');
xlabel('N');
ylabel('|u(b) - u*(b)|');
legend('rh', 'rq');

figure;
grid on;
loglog(XEU, NUMEU, '-xr');
title ('Runge 3rd Exp, TurbCase');
xlabel('N');
ylabel('M');