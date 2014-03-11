function [brojDodanih,ciklus] = genetski2 ( graf, brojGeneracija, kolikoPocetnih )

brJed = kolikoPocetnih;
%brojDodanih=zeros(1,brojGeneracija);
n=length(graf);
rjesenja=zeros(n-1,brJed);
populacija = populate (n-1,brJed); %pustimo mrave da naprave prvu generaciju
fit=fitness(populacija,graf,brJed,n-1);
    
for i=1:brojGeneracija
   
    %selekcija
    random = rand(brJed-1,1);
    [~,z]=max(fit);
    temp = fit(z);
    fit(z) = -Inf;
    [~,y] = max(fit);
    fit(z) = temp;
    rjesenja(1:n-1,1)=populacija(1:n-1,z);
    rjesenja(1:n-1,2) = populacija(1:n-1,y);
    sumf = sum(fit); %nikad nece biti nula
    vjerojatnost = fit/sumf;
    distr=distribucija(vjerojatnost,brJed);
    
for j=1:(brJed - 2)
    for k=1:brJed
        if (random(j)<=distr(k));
            rjesenja(1:n-1,j+2)=populacija(1:n-1,k);
            break;
        end;
    end;
end;

%krizanje je implementirano kao krizanje poretka
rjesenja=krizaj3(rjesenja,brJed,n-1);

%mutacija je implementirana kao jednostavna implementacija inverzijom
populacija=mutiraj(rjesenja,brJed,n-1,i/brojGeneracija);
fit=bridovi(populacija,graf,brJed,n-1);
%brojDodanih(i)=min(fit);    
maxf = max(fit);
fit = maxf - fit + 0.5;
end
vektor=bridovi(populacija,graf,brJed,n-1);
 [brojDodanih, indeks]=min(vektor);
 ciklus=populacija(1:n-1,indeks);
end
 