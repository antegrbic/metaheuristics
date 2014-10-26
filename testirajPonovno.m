function testirajPonovno
    k=3;
    rjGenetski=zeros(k,80000);
    vrijemeGenetski=zeros(k,1);
    vrijemeImunoloski=zeros(k,1);
    rjImunoloski=zeros(k,25000);
    [rjGenetski(1:k,1:80000),vrijemeGenetski(1:k)] = pozovi2(1002,80000,64,k);
    [rjImunoloski(1:k,1:25000),vrijemeImunoloski(1:k)] = pozovi5(1002,25000,64,k);
    rjMravljiBlizanac(1:k,1:25)=pozovi4(1002,25,15,k);
    save ('testiranje1000ZadnjiPokusaj.mat');
end