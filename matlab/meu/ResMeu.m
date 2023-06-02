%% Res for euler

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-3\exp\meu\x.txt", 'r');
XEU = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-3\exp\meu\rh.txt", 'r');
RHEU = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-3\exp\meu\rq.txt", 'r');
RQEU = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-3\exp\meu\num.txt", 'r');
NUMEU = fscanf(fid, '%g');

fclose all;

figure;
grid on;
loglog(XEU, RHEU, '-xr', XEU, RQEU, '-xb');
title ('Mod euler Exp, TurbCase');
xlabel('N');
ylabel('|u(b) - u*(b)|');
legend('rh', 'rq');

figure;
grid on;
loglog(XEU, NUMEU, '-xr');
title ('Mod Euler Exp, TurbCase');
xlabel('N');
ylabel('M');