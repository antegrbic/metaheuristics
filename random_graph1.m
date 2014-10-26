function [matricaInc] = random_graph1( n, indeks, c )

brojBridova = (n*(n-1))/2; %vjerojatnosna distribucija
vjerojatnost_svakog_brida = c/n;
brojac = 1;
%koliko_bridovi = 0;
r=rand(n,n);
for i=1:(n-1)
    for j=i+1:n
        %r = rand(1);
        %koliko_bridovi = koliko_bridovi + 1;
        if (r(i,j) < vjerojatnost_svakog_brida)
            bridovi(1,brojac) = i;
            bridovi(2,brojac) = j;
            brojac = brojac + 1;
        end
    end
end

matricaInc = zeros(n);

for i=1:(brojac-1)
    if (bridovi(1,i) > bridovi(2,i)) 
        matricaInc(bridovi(2,i),bridovi(1,i)) = 1;
    else
        matricaInc(bridovi(1,i),bridovi(2,i)) = 1;
    end
end
ime = dec2base(indeks,10);
matricaInc=sparse(matricaInc);
mmwrite(ime,matricaInc);
end