function [ brojBridova ] = provjera( perm, matrica )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

brojBridova = 0;
n = length(matrica);

for i=1:n-1 
    if (i == 1)
        if (matrica(1,perm(2)) == 0) brojBridova = brojBridova + 1;
        end
        if  (matrica(1,perm(n)) == 0) brojBridova = brojBridova + 1;
        end
    else
        if (perm(i) > perm(i+1)) 
            if (matrica(perm(i+1),perm(i)) == 0) brojBridova = brojBridova + 1;
            end
        else
            if (matrica(perm(i),perm(i+1)) == 0) brojBridova = brojBridova + 1;
            end
        end
    end
end

end

