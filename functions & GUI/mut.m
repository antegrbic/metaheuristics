function [vektor] = mut (ciklus)
velicina=length(ciklus);
vektor=zeros(velicina,1);
tocka =randsample(velicina,2);
ciklus=circshift(ciklus,1-tocka(1));
pocetak=ciklus(1:tocka(2)); %tocka(2) zapravo duljina
pocetak=flipud(pocetak); %flipud
vektor(1:tocka(2))=pocetak(1:tocka(2));
vektor((tocka(2)+1):velicina)=ciklus((tocka(2)+1):velicina);
vektor=circshift(vektor,tocka(1)-1);

%vjerojatnost= 0.1*(1-faza);
%random=rand(1);
%if (provjera2(vektor,graf)>provjera2(ciklus,graf))
%if(random>vjerojatnost)
%    vektor=ciklus;
%end
%end
end