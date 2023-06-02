%% General rq research

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-3\exp\ad\x.txt", 'r');
XEU = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-3\exp\eul\rq.txt", 'r');
NUMEU = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-3\exp\meu\rq.txt", 'r');
NUMME = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-3\exp\rk\rq.txt", 'r');
NUMRK = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-3\exp\ad\rq.txt", 'r');
NUMAD = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-3\imp\rq.txt", 'r');
NUMIM = fscanf(fid, '%g');

fclose all;

figure;
loglog(XEU, NUMEU, '-x', XEU, NUMME, '-o', XEU, NUMRK, '-|', XEU, NUMAD, '-', XEU, NUMIM, '-o');
grid on;
title ('График погрешности для q');
xlabel('Длина шага');
ylabel('Погрешность для q');
legend('Эйлер', 'Мод. Эйлер', 'Р-К 3(1/2)', 'Адамс 3', 'Неявный Эйлер');
