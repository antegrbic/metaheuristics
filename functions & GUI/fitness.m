function [fit] = fitness (populacija,matrica,brJed,velicina)
fit=zeros(brJed,1);
pop=populacija;
for j=1:brJed
    populacija(1:velicina,j);
    fit(j)=provjera2(pop(1:velicina,j),matrica);
end
maxf = max(fit);
fit = maxf - fit + 0.5;

end