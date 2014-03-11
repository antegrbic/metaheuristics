function testirajBlizanac(broj)
    k=3;
    vrijemeMravljiBlizanac=zeros(k,broj);
    rjMravljiBlizanac=zeros(k,25,broj);
    s=0;
    for i=1:broj
        for j=2000:2000:10000
            s=s+1;
            l=10+j/200;
            random_graph1(j,j+i,1);
            [rjMravljiBlizanac(1:k,1:l,s),vrijemeMravljiBlizanac(1:k,s)] = pozovi4(j+i,l,25,k);
        end
    end
save ('testiranjeBlizanac.mat');
end