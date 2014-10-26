ime = dec2base(202,10);
m=mmread(ime);
m=full(m);

tic
[y,~] = genetski2var_zagraf(m,8000,32,8);
minimum = min(y);
t = toc;
x = (1:8000);
plot(x,y);

disp(t);
disp(minimum);