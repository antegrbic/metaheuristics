function testiraj(broj)
    k=3;
    %rjGenetski1=zeros(k,broj);
    rjGenetski2=zeros(k,15000,broj);
    %vrijemeGenetski1=zeros(k,broj);
    vrijemeGenetski2=zeros(k,broj);
    vrijemeMravlji=zeros(k,broj);
    vrijemeMravljiBlizanac=zeros(k,broj);
    rjMravlji=zeros(k,1000,broj);
    rjMravljiBlizanac=zeros(k,25,broj);
    vrijemeImunoloski=zeros(k,broj);
    rjImunoloski=zeros(k,8000,broj);
   for i=1:broj
        %random_graph1(200,200+i,1);
        [rjGenetski2(1:k,1:15000,i),vrijemeGenetski2(1:k,i)] = pozovi2(1000+i,15000,64,k);
        [rjMravlji(1:k,1:1000,i),vrijemeMravlji(1:k,i)] = pozovi3(1000+i,1000,35,k);
        [rjMravljiBlizanac(1:k,1:25,i),vrijemeMravljiBlizanac(1:k,i)] = pozovi4(1000+i,25,15,k);
        [rjImunoloski(1:k,1:8000,i),vrijemeImunoloski(1:k,i)] = pozovi5(1000+i,8000,64,k);
   end
save ('testiranje1000Konvergencija.mat');
end