function [ perm ] = mijenjaj2( p, perm, clan )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

n = length(perm);
b = 0;
poz = clan+1;
q = n+1;

for i=1:4
    if(mod(p,factorial(n-clan-1+i)) == 0) q = n-i;
    end
end

pom = mod(perm(clan+1),n)+1;
while(1)
    if (clan + 2 >= q) b=1;
    end
    for j=(clan+2):q-1
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

pom = perm(clan+1);
perm(clan+1) = perm(poz);
perm(poz) = pom;

end
