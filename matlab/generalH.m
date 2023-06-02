%% General rh research

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-3\exp\ad\x.txt", 'r');
XEU = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-3\exp\eul\rh.txt", 'r');
NUMEU = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-3\exp\meu\rh.txt", 'r');
NUMME = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-3\exp\rk\rh.txt", 'r');
NUMRK = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-3\exp\ad\rh.txt", 'r');
NUMAD = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-3\imp\rh.txt", 'r');
NUMIM = fscanf(fid, '%g');

fclose all;

figure;
loglog(XEU, NUMEU, '-x', XEU, NUMME, '-o', XEU, NUMRK, '-|', XEU, NUMAD, '-', XEU, NUMIM, '-o');
grid on;
title ('График погрешности для h');
xlabel('Длина шага');
ylabel('Погрешность для h');
legend('Эйлер', 'Мод. Эйлер', 'Р-К 3(1/2)', 'Адамс 3', 'Неявный Эйлер');
