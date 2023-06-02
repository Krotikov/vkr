%% Open files

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\eul\grid251.txt", 'r');
GRIDE251 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\eul\y1_251.txt", 'r');
Y1E251 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\eul\y2_251.txt", 'r');
Y2E251 = fscanf(fid, '%g');

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\meu\grid251.txt", 'r');
GRIDM251 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\meu\y1_251.txt", 'r');
Y1M251 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\meu\y2_251.txt", 'r');
Y2M251 = fscanf(fid, '%g');

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\rk\grid251.txt", 'r');
GRIDR251 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\rk\y1_251.txt", 'r');
Y1R251 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\rk\y2_251.txt", 'r');
Y2R251 = fscanf(fid, '%g');

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\ad\grid251.txt", 'r');
GRIDA251 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\ad\y1_251.txt", 'r');
Y1A251 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\exp\ad\y2_251.txt", 'r');
Y2A251 = fscanf(fid, '%g');

fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\imp\grid251.txt", 'r');
GRIDI251 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\imp\y1_251.txt", 'r');
Y1I251 = fscanf(fid, '%g');
fid = fopen("S:\Online education\diplom\cpp\euler\results\p-4\imp\y2_251.txt", 'r');
Y2I251 = fscanf(fid, '%g');

fclose all;


%% Graphs 

figure;
semilogy(GRIDE251, Y1E251, '-', ...
     GRIDM251, Y1M251, '-.', ...
     GRIDR251, Y1R251, '--', ...
     GRIDA251, Y1A251, '-', ...
     GRIDI251, Y1I251, '.');
grid on;
colororder(["#f9c80e";"#dc0d55";"#009969";"#662e9b";"#43bccd"]);
title ('Погрешность h для N = 251');
legend('Эйлер', 'Мод. Эйлер', 'Р-К 3(1/2)', ...
       'Адамс 3', 'Неявный Эйлер');
xlabel('t');
ylabel('h');

figure;
semilogy(GRIDE251, Y2E251, '-', ...
     GRIDM251, Y2M251, '-.', ...
     GRIDR251, Y2R251, '--', ...
     GRIDA251, Y2A251, '-', ...
     GRIDI251, Y2I251, '.');
grid on;
colororder(["#f9c80e";"#dc0d55";"#009969";"#662e9b";"#43bccd"]);
title ('Погрешность q для N = 251');
legend('Эйлер', 'Мод. Эйлер', 'Р-К 3(1/2)', ...
       'Адамс 3', 'Неявный Эйлер');
xlabel('t');
ylabel('q');