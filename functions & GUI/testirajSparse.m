function testirajSparse(broj)
for n=100:200:1000
    for k=1:broj
        vjerojatnost_svakog_brida = 1/n;
        brojac = 1;
        %koliko_bridovi = 0;
        for i=1:(n-1)
            for j=i+1:n
                r = rand(1);
                %koliko_bridovi = koliko_bridovi + 1;
                if (r < vjerojatnost_svakog_brida)
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
        ime = dec2base(n+k,10);
        save(ime,'matricaInc','-ascii');
        pozovi4(n+k,20,15,3);
        for lj=1:n %radimo simetrican grafSparse
            matricaInc(lj:n,lj)=matricaInc(lj,lj:n);
        end
        matricaInc=sparse(matricaInc);
        pozovi4Sparse(matricaInc,20,15,3);
    end
end
end
    