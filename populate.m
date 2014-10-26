function [pop] = populate (velicina, brojPermutacija)
pop=zeros(velicina, brojPermutacija);
for i=1:brojPermutacija
    pop(1:velicina,i)=randsample(velicina,velicina)+1;
end
end
