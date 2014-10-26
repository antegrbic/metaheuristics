function [ brojDodanih, ciklus ] = genetskiGreedy( graf, brojGeneracija, kolikoPocetnih )

brJed = kolikoPocetnih;

n=length(graf);
rjesenja=zeros(n,brJed);
populacija = populate_gen_greedy(n,brJed);

for i=1:brojGeneracija
    fit=fitness(populacija,graf,brJed,n);
    
    %selekcija
    random = rand(brJed-1,1);
    [~,z]=max(fit);
    temp = fit(z);
    fit(z) = -Inf;
    [~,y] = max(fit);
    fit(z) = temp;
    rjesenja(1:n,1)=populacija(1:n,z);
    rjesenja(1:n,2) = populacija(1:n,y);
    novaPop(1:n,1)=populacija(1:n,z);
    novaPop(1:n,2) = populacija(1:n,y);
    sumf = sum(fit); %nikad nece biti nula
    vjerojatnost = fit/sumf;
    distr=distribucija(vjerojatnost,brJed);

for j=1:(brJed/2 - 2)
    for k=1:brJed
        if (random(j)<=distr(k));
            rjesenja(1:n,j+2)=populacija(1:n,k);
            break;
        end;
    end;
end;


temp = 2;
for i=1:(brJed/2)
    a = randsample(brJed/2,1);
    b = randsample(brJed/2,1);
    [dijete1, dijete2] = greedy_op(rjesenja(1:n,a), rjesenja(1:n,b));
    novaPop(1:n,temp+1) = dijete1(1:n);
    novaPop(1:n,temp+2) = dijete2(1:n);
    temp=temp+2;
end

rjesenja = novaPop; 
populacija=mutiraj(rjesenja,brJed,n,i/brojGeneracija);    
end

vektor=bridovi(populacija,graf,brJed,n);
 [brojDodanih, indeks]=min(vektor);
 ciklus=populacija(1:n,indeks);

end

