function [brojDodanih,ciklus] = mravljiBlizanac (graf, brojIteracija, brojMrava)

n=length(graf);
rjesenja=zeros(n,brojMrava);
parametar=0.5; %kolicina feromona
slabi=0.2;
%brojDodanih=zeros(1,brojIteracija);
for i=1:n %radimo simetrican graf
    graf(i:n,i)=graf(i,i:n);
end
%vektor-redak koji sadr�i broj susjeda svakog vrha
susjedi2=sum(graf);
globalniMinimum=n+1;
for i=1:brojIteracija
    for j=1:brojMrava
        nula=0;
        susjedi=susjedi2;
        [~, prvi]=min(susjedi);
        fer=graf(1:n,1:n);
        k=prvi;
        rjesenja(1,j)=prvi;
        indeksPrvog=1;
        if (susjedi(prvi)==0)
            nula=1;
        end
        susjediPrvi=susjedi(prvi); %posebno pamtimo susjede od prvog jer cemo brisati njegove veze
        random=rand(n,1);
        for lj=2:n
            if (fer(k,prvi)>0) %jos nismo obrisali k-ti redak u fer
                susjediPrvi=susjediPrvi-1;
            end
            fer(k,1:n)=zeros; %da ne smanjujemo kasnije susjede
            susjedi(k)=inf; %ne smijemo skociti na k
            if (nula==0)
            for h=1:n %svaki brid koji je bio susjed od k sad ima susjeda manje
                if (fer(h,k)>0)
                    susjedi(h)=susjedi(h)-1;
                end
            end
            end
            gotovo=0;
            if (nula==1) %dolazi blizanac
                nula=0;
                if(susjediPrvi==0)
                    [~, rjesenja(lj,j)]=min(susjedi); %skocili smo
                    prvi=rjesenja(lj,j);
                    indeksPrvog=lj;
                    k=prvi;
                    gotovo=1;
                    if (susjedi(prvi)==0)
                        nula=1;
                    end
                    susjediPrvi=susjedi(prvi);
                else
                    pomocni=rjesenja(indeksPrvog:(lj-1),j); %provjeri dal ovo radi
                    for t=indeksPrvog:lj-1
                        rjesenja(indeksPrvog+lj-1-t,j)=pomocni(t-indeksPrvog+1);
                    end
                    susjediPrvi=0;
                    k=prvi;
                end
            end  
            if (gotovo==0)
                sumf=sum(fer(1:n,k));
                vjerojatnost=fer(1:n,k)/sumf;
                distr=distribucija(vjerojatnost,n);
                k=1;
                while(random(lj)>=distr(k))
                    k=k+1;
                end
                rjesenja(lj,j)=k;
                if (susjedi(k)==0)
                    nula=1;
                end
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