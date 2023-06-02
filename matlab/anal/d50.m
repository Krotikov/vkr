%% Open files

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\eul\grid50.txt", 'r');
GRIDE50 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\eul\y1_50.txt", 'r');
Y1E50 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\eul\y2_50.txt", 'r');
Y2E50 = fscanf(fid, '%g');

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\meu\grid50.txt", 'r');
GRIDM50 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\meu\y1_50.txt", 'r');
Y1M50 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\meu\y2_50.txt", 'r');
Y2M50 = fscanf(fid, '%g');

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\rk\grid50.txt", 'r');
GRIDR50 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\rk\y1_50.txt", 'r');
Y1R50 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\rk\y2_50.txt", 'r');
Y2R50 = fscanf(fid, '%g');

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\ad\grid50.txt", 'r');
GRIDA50 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\ad\y1_50.txt", 'r');
Y1A50 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\ad\y2_50.txt", 'r');
Y2A50 = fscanf(fid, '%g');

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\imp\grid50.txt", 'r');
GRIDI50 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\imp\y1_50.txt", 'r');
Y1I50 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\imp\y2_50.txt", 'r');
Y2I50 = fscanf(fid, '%g');

fclose all;


%% Graphs 

figure;
semilogy(GRIDE50, Y1E50, '-', ...
     GRIDM50, Y1M50, '-.', ...
     GRIDR50, Y1R50, '--', ...
     GRIDA50, Y1A50, '-', ...
     GRIDI50, Y1I50, '.');
grid on;
colororder(["#f9c80e";"#dc0d55";"#009969";"#662e9b";"#43bccd"]);
title ('Погрешность h для N = 50');
legend('Эйлер', 'Мод. Эйлер', 'Р-К 3(1/2)', ...
       'Адамс 3', 'Неявный Эйлер');
xlabel('t');
ylabel('h');

figure;
semilogy(GRIDE50, Y2E50, '-', ...
     GRIDM50, Y2M50, '-.', ...
     GRIDR50, Y2R50, '--', ...
     GRIDA50, Y2A50, '-', ...
     GRIDI50, Y2I50, '.');
grid on;
colororder(["#f9c80e";"#dc0d55";"#009969";"#662e9b";"#43bccd"]);
title ('Погрешность q для N = 50');
legend('Эйлер', 'Мод. Эйлер', 'Р-К 3(1/2)', ...
       'Адамс 3', 'Неявный Эйлер');
xlabel('t');
ylabel('q');