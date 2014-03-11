function [brid] = bridovi(populacija,matrica,brJed,velicina)
brid=zeros(brJed,1);
for j=1:brJed
    brid(j)=provjera2(populacija(1:velicina,j),matrica);
end
end