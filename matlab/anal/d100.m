%% Open files

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\eul\grid100.txt", 'r');
GRIDE100 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\eul\y1_100.txt", 'r');
Y1E100 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\eul\y2_100.txt", 'r');
Y2E100 = fscanf(fid, '%g');

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\meu\grid100.txt", 'r');
GRIDM100 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\meu\y1_100.txt", 'r');
Y1M100 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\meu\y2_100.txt", 'r');
Y2M100 = fscanf(fid, '%g');

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\rk\grid100.txt", 'r');
GRIDR100 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\rk\y1_100.txt", 'r');
Y1R100 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\rk\y2_100.txt", 'r');
Y2R100 = fscanf(fid, '%g');

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\ad\grid100.txt", 'r');
GRIDA100 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\ad\y1_100.txt", 'r');
Y1A100 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\ad\y2_100.txt", 'r');
Y2A100 = fscanf(fid, '%g');

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\imp\grid100.txt", 'r');
GRIDI100 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\imp\y1_100.txt", 'r');
Y1I100 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\imp\y2_100.txt", 'r');
Y2I100 = fscanf(fid, '%g');

fclose all;


%% Graphs 

figure;
semilogy(GRIDE100, Y1E100, '-', ...
     GRIDM100, Y1M100, '-.', ...
     GRIDR100, Y1R100, '--', ...
     GRIDA100, Y1A100, '-', ...
     GRIDI100, Y1I100, '.');
grid on;
colororder(["#f9c80e";"#dc0d55";"#009969";"#662e9b";"#43bccd"]);
title ('Погрешность h для N = 100');
legend('Эйлер', 'Мод. Эйлер', 'Р-К 3(1/2)', ...
       'Адамс 3', 'Неявный Эйлер');
xlabel('t');
ylabel('h');

figure;
semilogy(GRIDE100, Y2E100, '-', ...
     GRIDM100, Y2M100, '-.', ...
     GRIDR100, Y2R100, '--', ...
     GRIDA100, Y2A100, '-', ...
     GRIDI100, Y2I100, '.');
grid on;
colororder(["#f9c80e";"#dc0d55";"#009969";"#662e9b";"#43bccd"]);
title ('Погрешность q для N = 100');
legend('Эйлер', 'Мод. Эйлер', 'Р-К 3(1/2)', ...
       'Адамс 3', 'Неявный Эйлер');
xlabel('t');
ylabel('q');