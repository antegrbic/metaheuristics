ime = dec2base(1002,10);
m=mmread(ime);
m=full(m);
y = zeros(3,80000);

for i=1:3
    tic
    [y(i,:),~] = genetski2var_zagraf(m,80000,32,4);
    minimum(i) = min(y(i,:));
    t(i) = toc;
end    

vrijeme = (t(1)+t(2)+t(3))/3;
z = (y(1,:)+y(2,:)+y(3,:))/3;
x = (1:80000);
plot(x,z);
title('Genetski algoritam');
xlabel('Broj iteracija');
ylabel('Broj dodanih bridova');
        

m = sum(minimum)/3;
disp(vrijeme);
disp(m);