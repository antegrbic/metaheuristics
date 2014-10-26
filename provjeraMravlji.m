function [ brojBridova ] = provjeraMravlji( perm, matrica )

brojBridova = 0;
n = length(matrica);

for i=1:n 
    if (i == 1)
        if  (matrica(perm(1),perm(n)) == 0) brojBridova = brojBridova + 1;
        end
    else
            if (matrica(perm(i-1),perm(i)) == 0) brojBridova = brojBridova + 1;
            end
    end
end

end

