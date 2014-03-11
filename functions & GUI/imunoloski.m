function [brojDodanih,ciklus] = imunoloski ( graf, brojGeneracija, kolikoPocetnih, brojKlonova )

brJed = kolikoPocetnih;
%brojDodanih=zeros(1,brojGeneracija);
n=length(graf);
pop=zeros(n-1,(brojKlonova+1)*brJed);
populacija = populate (n-1,brJed); %random permutacija n-1 elemenata od 2 do n i tako brJed puta

for i=1:brojGeneracija
    %fit=fitness(populacija,graf,brJed,n-1);
  
    pop(1:n-1,1:brJed)=populacija;
    for s=1:brojKlonova
    for j=1:brJed
        pop(1:n-1,j+s*brJed)=mut(populacija(1:n-1,j));
    end
    end
    %fit2=fitness(pop,graf,(brojKlonova+1)*brJed,n-1);
    fit2=bridovi(pop,graf,(brojKlonova+1)*brJed,n-1);
    %brojDodanih(i)=min(fit2);    
    maxf = max(fit2);
    fit2 = maxf - fit2 + 0.5;
    for l=1:brJed
        [~,z]=max(fit2);
        populacija(1:n-1,l)=pop(1:n-1,z);
        fit2(z)=0;
    end

end
vektor=bridovi(populacija,graf,brJed,n-1);
 [brojDodanih, indeks]=min(vektor);
 ciklus=populacija(1:n-1,indeks);
end
 
 