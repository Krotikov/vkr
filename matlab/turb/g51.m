%% Open files
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-5\x.txt", 'r');
GRK6 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-5\rh.txt", 'r');
Y1RK6 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-5\rq.txt", 'r');
Y2RK6 = fscanf(fid, '%g');


fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\eul\grid51.txt", 'r');
GRIDE51 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\eul\y1_51.txt", 'r');
Y1E51 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\eul\y2_51.txt", 'r');
Y2E51 = fscanf(fid, '%g');

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\meu\grid51.txt", 'r');
GRIDM51 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\meu\y1_51.txt", 'r');
Y1M51 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\meu\y2_51.txt", 'r');
Y2M51 = fscanf(fid, '%g');

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\rk\grid51.txt", 'r');
GRIDR51 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\rk\y1_51.txt", 'r');
Y1R51 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\rk\y2_51.txt", 'r');
Y2R51 = fscanf(fid, '%g');

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\ad\grid51.txt", 'r');
GRIDA51 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\ad\y1_51.txt", 'r');
Y1A51 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\ad\y2_51.txt", 'r');
Y2A51 = fscanf(fid, '%g');

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\imp\grid51.txt", 'r');
GRIDI51 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\imp\y1_51.txt", 'r');
Y1I51 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\imp\y2_51.txt", 'r');
Y2I51 = fscanf(fid, '%g');

fclose all;


%% Graphs for simple case

%first case

figure;
hold on;
plot(GRK6, Y1RK6, '-', ...
     GRIDE51, Y1E51, '-', ...
     GRIDM51, Y1M51, '-.', ...
     GRIDR51, Y1R51, '--', ...
     GRIDA51, Y1A51, '-', ...
     GRIDI51, Y1I51, '.');
grid on;
colororder(["#4c4142";"#f9c80e";"#dc0d55";"#009969";"#662e9b";"#43bccd"]);
title ('Решение h для сетки N = 51');
legend('Аналитическое', 'Эйлер', ...
       'Мод. Эйлер', 'Р-К 3(1/2)', ...
       'Адамс 3', 'Неявный Эйлер');
xlabel('t');
ylabel('h');

figure;
hold on;
plot(GRK6, Y2RK6, '-', ...
     GRIDE51, Y2E51, '-', ...
     GRIDM51, Y2M51, '-.', ...
     GRIDR51, Y2R51, '--', ...
     GRIDA51, Y2A51, '-', ...
     GRIDI51, Y2I51, '.');
grid on;
colororder(["#4c4142";"#f9c80e";"#dc0d55";"#009969";"#662e9b";"#43bccd"]);
title ('Решение q для сетки N = 51');
legend('Аналитическое', 'Эйлер', ...
       'Мод. Эйлер', 'Р-К 3(1/2)', ...
       'Адамс 3', 'Неявный Эйлер');
xlabel('t');
ylabel('q');