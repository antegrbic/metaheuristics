function [ output_args ] = ispisPerm( n )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

ukupno = factorial(n);

t = ukupno/n;

perm = (1:n);
brojac = 0;
min = n*(n-1)/2;

for p=0:t-1
    faktI=ukupno;
    
    for j=0:n-2
        faktI = faktI/(n-j);
        if (mod(p,faktI) == 0) perm = mijenjaj2(p,perm,j);
        end
    end
    
    brojac = brojac + 1;
    disp(perm);
   
end

disp(brojac);

end

