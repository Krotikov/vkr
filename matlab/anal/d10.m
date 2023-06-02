%% Open files

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\eul\grid10.txt", 'r');
GRIDE10 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\eul\y1_10.txt", 'r');
Y1E10 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\eul\y2_10.txt", 'r');
Y2E10 = fscanf(fid, '%g');

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\meu\grid10.txt", 'r');
GRIDM10 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\meu\y1_10.txt", 'r');
Y1M10 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\meu\y2_10.txt", 'r');
Y2M10 = fscanf(fid, '%g');

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\rk\grid10.txt", 'r');
GRIDR10 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\rk\y1_10.txt", 'r');
Y1R10 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\rk\y2_10.txt", 'r');
Y2R10 = fscanf(fid, '%g');

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\ad\grid10.txt", 'r');
GRIDA10 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\ad\y1_10.txt", 'r');
Y1A10 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\ad\y2_10.txt", 'r');
Y2A10 = fscanf(fid, '%g');

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\imp\grid10.txt", 'r');
GRIDI10 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\imp\y1_10.txt", 'r');
Y1I10 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\imp\y2_10.txt", 'r');
Y2I10 = fscanf(fid, '%g');

fclose all;


%% Graphs 

figure;
semilogy(GRIDE10, Y1E10, '-', ...
     GRIDM10, Y1M10, '-.', ...
     GRIDR10, Y1R10, '--', ...
     GRIDA10, Y1A10, '-', ...
     GRIDI10, Y1I10, '.');
grid on;
colororder(["#f9c80e";"#dc0d55";"#009969";"#662e9b";"#43bccd"]);
title ('Погрешность h для N = 10');
legend('Эйлер', 'Мод. Эйлер', 'Р-К 3(1/2)', ...
       'Адамс 3', 'Неявный Эйлер');
xlabel('t');
ylabel('h');

figure;
semilogy(GRIDE10, Y2E10, '-', ...
     GRIDM10, Y2M10, '-.', ...
     GRIDR10, Y2R10, '--', ...
     GRIDA10, Y2A10, '-', ...
     GRIDI10, Y2I10, '.');
grid on;
colororder(["#f9c80e";"#dc0d55";"#009969";"#662e9b";"#43bccd"]);
title ('Погрешность q для N = 10');
legend('Эйлер', 'Мод. Эйлер', 'Р-К 3(1/2)', ...
       'Адамс 3', 'Неявный Эйлер');
xlabel('t');
ylabel('q');