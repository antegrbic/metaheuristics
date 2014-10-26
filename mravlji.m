function [brojDodanih,ciklus] = mravlji (graf, brojIteracija, brojMrava)
n=length(graf);
rjesenja=zeros(n,brojMrava);
parametar=2; %kolicina feromona
slabi=0.2;
%brojDodanih=zeros(1,brojIteracija);
for i=1:n %radimo simetrican graf
    graf(i:n,i)=graf(i,i:n);
end
globalniMinimum=n+1;
    
for i=1:brojIteracija
    for j=1:brojMrava
        
        vektor=randsample(n,n);
        rjesenja(1,j)=1;
        fer=graf(1:n,1:n);
        k=1;
		br=0;
        
        for lj=2:n
            fer(k,1:n)=zeros;
            sumf=sum(fer(1:n,k));
            
            if (sumf==0) %skoci
                true=1;
				br=br+1;
                while (true==1)
                    true=0;
                for m=1:lj-1
                    if (vektor(br)==rjesenja(m,j))
                        br=br+1;
                        true=1;
                        break;
                    end
                end
                end
                k=vektor(br);
                rjesenja(lj,j)=k;  
                
            else
                vjerojatnost=fer(1:n,k)/sumf;
                distr=distribucija(vjerojatnost,n);
                random=rand(n,1);
                k=1;
                while(random(lj)>=distr(k))
                    k=k+1;
                end
                rjesenja(lj,j)=k;
            end
            
        end
    end
    fit=fitnessMravlji(rjesenja,graf,brojMrava,n);
    [minimum,indeks]=min(fit);
    najbolje=rjesenja(1:n,indeks);
    if(minimum<globalniMinimum)
        ciklus=najbolje;
        globalniMinimum=minimum;
    end
    %slabimo trag
    graf=graf*(1-slabi);
    %ostavljamo trag na svim bridovima iz rjesenje(1:n,indeks)
    if(graf(ciklus(n),ciklus(1))~=0)
        graf(ciklus(n),ciklus(1))=graf(ciklus(n),ciklus(1))+parametar;
        graf(ciklus(1),ciklus(n))=graf(ciklus(1),ciklus(n))+parametar;
    end
    for m=2:n
    if(graf(ciklus(m),ciklus(m-1))~=0)
        graf(ciklus(m),ciklus(m-1))=graf(ciklus(m),ciklus(m-1))+parametar;
        graf(ciklus(m-1),ciklus(m))=graf(ciklus(m-1),ciklus(m))+parametar;
    end
    end
    %brojDodanih(i)=minimum;
    if(minimum==0) break;
    end
    
end
brojDodanih=globalniMinimum;
end