function [pop] = mutiraj (rjesenja,brJed,velicina,faza)
vjerojatnost= 0.05*(1-faza)+0.035;
random=rand(brJed,1);
pop=rjesenja;
for j=2:brJed
    if(random(j)<vjerojatnost)
        pop(1:velicina,j)=mut(rjesenja(1:velicina,j));
    end
end
end