function prikaziRezultate
rez=load('testiranje1000ZadnjiPokusaj.mat');
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
plot(mr(1,1:1000,2));
title('Mravlji algoritam');
xlabel('Broj iteracija');
ylabel('Broj dodanih bridova');
saveas(m,'Mr1000','png');
i=figure(2);
plot(im(1,1:8000,2));
title('Imunoloski algoritam');
xlabel('Broj iteracija');
ylabel('Broj dodanih bridova');
saveas(i,'Im1000','png');
figure(3);
g=plot(gen(1,1:15000,2));
title('Genetski algoritam');
xlabel('Broj iteracija');
ylabel('Broj dodanih bridova');
saveas(g,'Gen1000','png');
mb=figure(4);
plot(mrBl(1,1:25,2));
title('Mravlji algoritam "Blizanac"');
xlabel('Broj iteracija');
ylabel('Broj dodanih bridova');
saveas(mb,'MrBl1000','png');
mravlji=mrMin(1,1,2)
blizanac=min(mrBl(1,1:25,2))
genetski=min(gen(1,1:15000,2))
imunoloski=min(im(1,1:8000,2))
mravljiVrijeme=rez.vrijemeMravlji;
mravljiVrijeme=sum(mravljiVrijeme);
mravljiVrijeme=mravljiVrijeme/3;
blizanacVrijeme=rez.vrijemeMravljiBlizanac;
blizanacVrijeme=sum(blizanacVrijeme);
blizanacVrijeme=blizanacVrijeme/3;
genetskiVrijeme=rez.vrijemeGenetski2;
genetskiVrijeme=sum(genetskiVrijeme);
genetskiVrijeme=genetskiVrijeme/3;
imunoloskiVrijeme=rez.vrijemeImunoloski;
imunoloskiVrijeme=sum(imunoloskiVrijeme);
imunoloskiVrijeme=imunoloskiVrijeme/3;
vrijemeMr=mravljiVrijeme(2)
vrijemeBl=blizanacVrijeme(2)
vrijemeGen=genetskiVrijeme(2)
vrijemeIm=imunoloskiVrijeme(2)
end