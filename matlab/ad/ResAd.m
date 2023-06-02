%% Res for euler

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-3\exp\ad\x.txt", 'r');
XEU = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-3\exp\ad\rh.txt", 'r');
RHEU = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-3\exp\ad\rq.txt", 'r');
RQEU = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-3\exp\ad\num.txt", 'r');
NUMEU = fscanf(fid, '%g');

fclose all;

figure;
grid on;
loglog(XEU, RHEU, '-xr', XEU, RQEU, '-xb');
title ('Adams 3rd Exp, TurbCase');
xlabel('N');
ylabel('|u(b) - u*(b)|');
legend('rh', 'rq');

figure;
grid on;
loglog(XEU, NUMEU, '-xr');
title ('Adams 3rd Exp, TurbCase');
xlabel('N');
ylabel('M');