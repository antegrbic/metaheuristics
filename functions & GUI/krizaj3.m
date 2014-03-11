function [rj] = krizaj3 (rjesenja, brJed, velicina)
duljina=40;
next=0;
kreni=randsample(velicina,1);
redoslijed=randsample(brJed,brJed);
rjesenja=circshift(rjesenja, [1-kreni,0]);
novaRjesenja=zeros(velicina,brJed);

for j=3:brJed
    novaRjesenja(1:duljina,j)=rjesenja(1:duljina,redoslijed(j-2));
    br=duljina+1;
    k=br;
    while (k<=velicina)
        for i=1:duljina
            if (rjesenja(br,redoslijed(j-1))==novaRjesenja(i,j)) 
                next=1; 
                k=k-1;
            end
        end
        if(next==0) 
            novaRjesenja(k,j)=rjesenja(br,redoslijed(j-1));
        end
        br=br+1;
        if (br>velicina) br=1;
        end
        k=k+1;
        next=0;
    end
    
end

rjesenja(1:velicina,3:brJed)=novaRjesenja(1:velicina,3:brJed);
rj=circshift(rjesenja, [kreni-1,0]);
end
