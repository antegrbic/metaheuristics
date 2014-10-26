function [fit] = fitnessMravlji (rjesenja,graf,brojMrava,velicina)
fit=zeros(brojMrava,1);
for j=1:brojMrava
    fit(j)=provjeraMravlji(rjesenja(1:velicina,j),graf);
end

end
