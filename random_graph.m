function [matricaInc] = random_graph( n, indeks )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

brojBridova = randsample((n*(n-1))/2,1); %vjerojatnosna distribucija
brojac = 0;

while(brojac < brojBridova)
    prvi = randsample(n,1);
    drugi = randsample(n,1);
    if (prvi == drugi)
        while(1)
            drugi = randsample(n,1);
            if (drugi ~= prvi) break;
            end
        end
    end
    if (brojac == 0) 
        bridovi(1,brojac+1) = prvi;
        bridovi(2,brojac+1) = drugi;
        brojac = brojac + 1;
    else
        nadjen = 0;
        for l=1:brojac
            if (bridovi(1,l) == prvi && bridovi(2,l) == drugi) nadjen = 1;
            end
        end
        
        if (nadjen == 0) 
            bridovi(1,brojac+1) = prvi;
            bridovi(2,brojac+1) = drugi;
            brojac = brojac + 1;
        end
    
    end
    
    
end

matricaInc = zeros(n);

for i=1:brojac
    if (bridovi(1,i) > bridovi(2,i)) 
        matricaInc(bridovi(2,i),bridovi(1,i)) = 1;
    else
        matricaInc(bridovi(1,i),bridovi(2,i)) = 1;
    end
end

ime = dec2base(indeks,10);

save(ime,'matricaInc','-ascii');

end

