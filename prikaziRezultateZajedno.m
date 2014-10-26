function prikaziRezultateZajedno
rez=load('testiranje200Konvergencija.mat');
mr=rez.rjMravlji;
mrBl=rez.rjMravljiBlizanac;
gen=rez.rjGenetski2;
im=rez.rjImunoloski;
mrMin=min(mr,[],2);
mrMin=sum(mrMin);
mrMin=mrMin/3;
mr=sum(mr);
mrBl=sum(mrBl);
gen=sum(gen);
im=sum(im);
mr=mr/3;
im=im/3;
gen=gen/3;
mrBl=mrBl/3;
m=figure(1);

blizanac=min(mrBl);
genetski=min(gen);
imunoloski=min(im);
a(1:10,1)=genetski(1:10);
a(1:10,2)=imunoloski(1:10);
a(1:10,3)=mrMin(1:10);
a(1:10,4)=blizanac(1:10);

bar(a);
axis([0 11 80 160]);
title('Konaèna rješenja');
xlabel('Indeks grafa');
ylabel('Broj dodanih bridova');
legend('Genetksi algoritam','Imunoloski algoritam','Mravlji algoritam','Mravlji algoritam "Blizanac"');
n=figure(2);
a(1:10,1)=genetski(11:20);
a(1:10,2)=imunoloski(11:20);
a(1:10,3)=mrMin(11:20);
a(1:10,4)=blizanac(11:20);
bar(a);
axis([0 11 80 160]);
title('Konaèna rješenja');
xlabel('Indeks grafa');
ylabel('Broj dodanih bridova');
legend('Genetksi algoritam','Imunoloski algoritam','Mravlji algoritam','Mravlji algoritam "Blizanac"');
k=figure(3);
a(1:10,1)=genetski(21:30);
a(1:10,2)=imunoloski(21:30);
a(1:10,3)=mrMin(21:30);
a(1:10,4)=blizanac(21:30);
bar(a);
axis([0 11 80 160]);

title('Konaèna rješenja');
xlabel('Indeks grafa');
ylabel('Broj dodanih bridova');
legend('Genetksi algoritam','Imunoloski algoritam','Mravlji algoritam','Mravlji algoritam "Blizanac"');
saveas(m,'prvih10','png');
saveas(n,'drugih10','png');
saveas(k,'zadnjih10','png');

blizanac=sum(blizanac);
blizanac=blizanac/60
end