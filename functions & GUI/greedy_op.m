function [ dijete1, dijete2] = greedy_op( roditelj1, roditelj2 )

n = length(roditelj1);

brojac = 0;
podjela{1} = [];

[brZajBridova] = nadjiPresjek(roditelj1,roditelj2);
if (brZajBridova == 0)
    dijete1 = mut(roditelj1);
    dijete2 = mut(roditelj2);
    return;
else

a = transpose(roditelj1);
b = transpose(roditelj2);
sort(a);
sort(b);
disp(a);
disp(b);
    
for i=1:n
    for j=1:n
        if(roditelj1(i) == roditelj2(j))
            if(j == n)
                R = roditelj2(1);
                break;
            else 
                R = roditelj2(j+1);
                break;
            end
        end
    end
    
    if (i==n)
        if (roditelj1(1) == R)
           temp(1,1) = roditelj1(i);
           temp(1,2) = R; 
           [podjela,brojac] = dodaj_brid(podjela, brojac, temp);   
        end
    else
        if (roditelj1(i+1) == R)   
            temp(1,1) = roditelj1(i);
            temp(1,2) = R;
            [podjela,brojac] = dodaj_brid(podjela, brojac, temp);   
        end
    end
end
    
iskoristeni = (1:n);
for i=1:brojac
    for j=1:length(podjela{i})
        iskoristeni(podjela{i}(j)) = 0;
    end
end

indeksi_pozitivnih = find(iskoristeni>0);
for i=1:length(indeksi_pozitivnih)
    brojac = brojac + 1;
    podjela{brojac} = iskoristeni(indeksi_pozitivnih(i));
end

perm1 = randsample(brojac, brojac);
perm2 = randsample(brojac, brojac);

dijete1 = []; 
dijete2 = [];

for i=1:brojac
    dijete1 = [dijete1 podjela{perm1(i)}];
    dijete2 = [dijete2 podjela{perm2(i)}];
end 

end

end

