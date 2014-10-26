function [brojDodanih,ciklus] = genetski ( graf, brojGeneracija, kolikoPocetnih )

brJed = kolikoPocetnih;

n=length(graf);
rjesenja=zeros(n-1,brJed);
populacija = populate (n-1,brJed); %random permutacija n-1 elemenata od 2 do n i tako brJed puta

for i=1:brojGeneracija
    fit=fitness(populacija,graf,brJed,n-1);
    
    %selekcija
    random = rand(brJed/2-1,1);
    [~,z]=max(fit);
    rjesenja(1:n-1,1)=populacija(1:n-1,z);
    fit(z)=0;
    sumf = sum(fit); %nikad nece biti nula
    vjerojatnost = fit/sumf;
    distr=distribucija(vjerojatnost,brJed);
    
for j=1:brJed/2-1
    for k=1:brJed
        if (random(j)<=distr(k));
            rjesenja(1:n-1,j+1)=populacija(1:n-1,k);
            %ne zelimo isto rjesenje dvaputa
            temp=fit(k);
            fit(k)=0;
            sumf=sumf-temp;
            postotak=fit/sumf;
            distr=distribucija(postotak,brJed);
            break;
        end;
    end;
end;

%krizanje je implementirano kao krizanje poretka
rjesenja=krizaj(rjesenja,brJed,n-1);

%mutacija je implementirana kao jednostavna implementacija inverzijom
populacija=mutiraj(rjesenja,brJed,n-1,i/brojGeneracija);
    
end
vektor=bridovi(populacija,graf,brJed,n-1);
 [brojDodanih, indeks]=min(vektor);
 ciklus=populacija(1:n-1,indeks);
end
 
 