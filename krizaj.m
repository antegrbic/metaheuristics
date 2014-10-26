function [rj] = krizaj (rjesenja, brJed, velicina)
duljina=20;
next=0;
kreni=randsample(velicina,1);
redoslijed=randsample(brJed/2,brJed/2);
rjesenja=circshift(rjesenja, [1-kreni,0]);
novaRjesenja=zeros(velicina,brJed);

for j=2:brJed/2
    novaRjesenja(1:duljina,2*j-1)=rjesenja(1:duljina,redoslijed(j-1));
    br=duljina+1;
    k=br;
    while (k<=velicina)
        for i=1:duljina
            if (rjesenja(br,redoslijed(j))==novaRjesenja(i,2*j-1)) 
                next=1; 
                k=k-1;
            end
        end
        if(next==0) 
            novaRjesenja(k,2*j-1)=rjesenja(br,redoslijed(j));
        end
        br=br+1;
        if (br>velicina) br=1;
        end
        k=k+1;
        next=0;
    end
    
    novaRjesenja(1:duljina,2*j)=rjesenja(1:duljina,redoslijed(j));
    br=duljina+1;
    k=br;
    while (k<=velicina)
        for i=1:duljina
            if (rjesenja(br,redoslijed(j-1))==novaRjesenja(i,2*j)) 
                next=1; 
                k=k-1;
            end
        end
        if(next==0) 
            novaRjesenja(k,2*j)=rjesenja(br,redoslijed(j-1));
        end
        br=br+1;
        if(br>velicina) br=1;
        end
        k=k+1;
        next=0;
    end
end

rjesenja(1:velicina,3:brJed)=novaRjesenja(1:velicina,3:brJed);
rj=circshift(rjesenja, [kreni-1,0]);
end
