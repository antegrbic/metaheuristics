function prikaziRezultate2
rez=load('testiranje1000ZadnjiPokusaj.mat');

gen=rez.rjGenetski;
im=rez.rjImunoloski;

gen=sum(gen);
im=sum(im);
im=im/3;
gen=gen/3;

i=figure(2);
plot(im(1,1:25000));
title('Imunoloski algoritam');
xlabel('Broj iteracija');
ylabel('Broj dodanih bridova');
saveas(i,'Im1000','png');
figure(3);
g=plot(gen(1,1:80000));
title('Genetski algoritam');
xlabel('Broj iteracija');
ylabel('Broj dodanih bridova');
saveas(g,'Gen1000','png');

genetski=min(gen(1,1:80000))
imunoloski=min(im(1,1:25000))

genetskiVrijeme=rez.vrijemeGenetski;
genetskiVrijeme=sum(genetskiVrijeme);
genetskiVrijeme=genetskiVrijeme/3;
imunoloskiVrijeme=rez.vrijemeImunoloski;
imunoloskiVrijeme=sum(imunoloskiVrijeme);
imunoloskiVrijeme=imunoloskiVrijeme/3;

vrijemeGen=genetskiVrijeme
vrijemeIm=imunoloskiVrijeme
end