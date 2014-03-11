function [pop] = populate_gen_greedy (velicina, brojPermutacija)
pop=zeros(velicina, brojPermutacija);
for i=1:brojPermutacija
    pop(1:velicina,i)=randsample(velicina,velicina);
end
end
