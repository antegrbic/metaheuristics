function [brojDodanih,ciklus] = genetski2var_zagraf ( graf, brojGeneracija, kolikoPocetnih, elitizam )

brJed = kolikoPocetnih;
brojDodanih = zeros(1,brojGeneracija);
n=length(graf);
rjesenja=zeros(n-1,brJed);
populacija = populate (n-1,brJed); %random permutacija n-1 elemenata od 2 do n i tako brJed puta

for i=1:brojGeneracija
    fit=fitness(populacija,graf,brJed,n-1);
    
    %selekcija
    random = rand(brJed-1,1);
    
    for k=1:elitizam
        [~,z]=max(fit);
        temp = fit(z);
        fit(z) = 0;
        %disp(transpose(populacija(1:n-1,z)));
        rjesenja(1:n-1,k)=populacija(1:n-1,z);
    end
   
    sumf = sum(fit); %nikad nece biti nula
    vjerojatnost = fit/sumf;
    distr=distribucija(vjerojatnost,brJed);
    
for j=1:(brJed - elitizam)
    for k=1:brJed
        if (random(j)<=distr(k));
            rjesenja(1:n-1,j+elitizam)=populacija(1:n-1,k);
            break;
        end;
    end;
end;

%krizanje je implementirano kao krizanje poretka
rjesenja=krizaj3var(rjesenja,brJed,n-1,elitizam);

%mutacija je implementirana kao jednostavna implementacija inverzijom
populacija=mutiraj(rjesenja,brJed,n-1,i/brojGeneracija);
fit=bridovi(populacija,graf,brJed,n-1);
brojDodanih(i)=min(fit);    
maxf = max(fit);
fit = maxf - fit + 0.5;
end
vektor=bridovi(populacija,graf,brJed,n-1);
 [~, indeks]=min(vektor);
 ciklus=populacija(1:n-1,indeks);
end
 