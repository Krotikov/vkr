%% General complexity research

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-3\exp\ad\x.txt", 'r');
XEU = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-3\exp\eul\num.txt", 'r');
NUMEU = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-3\exp\meu\num.txt", 'r');
NUMME = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-3\exp\rk\num.txt", 'r');
NUMRK = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-3\exp\ad\num.txt", 'r');
NUMAD = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-3\imp\num.txt", 'r');
NUMIM = fscanf(fid, '%g');

fclose all;

figure;
grid on;
loglog(XEU, NUMEU, '-x', XEU, NUMME, '-o', XEU, NUMRK, '-|', XEU, NUMAD, '-', XEU, NUMIM, '-o');
title ('Number f, g calls');
xlabel('h');
ylabel('M');
legend('Euler', 'Mod Euler', 'Runge 3rd', 'Adams 3rd', 'Implicit euler');

