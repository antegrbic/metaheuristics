function [ perm ] = mijenjaj( p, perm, clan )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

n = length(perm);
b = 0;
poz = clan;
q = n;

for i=1:4
    if(mod(p,factorial(n-clan+i)) == 0) q = n-i;
    end
end

pom = mod(perm(clan),n)+1;
while(1)
    if (clan + 1 >= q) b=1;
    end
    for j=(clan+1):q-1
        if(perm(j) == pom) 
            poz = j;
            b = 1;
            break;
        end
    end
    if (b == 1 ) break;
    else pom = mod(pom,n) + 1;
    end
end

pom = perm(clan);
perm(clan) = perm(poz);
perm(poz) = pom;

end

