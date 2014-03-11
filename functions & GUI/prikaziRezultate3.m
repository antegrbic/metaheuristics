function prikaziRezultate3
rez=load('testiranjeBlizanac.mat');

bl(1:3,1:60,1:5)=rez.rjMravljiBlizanac(1:3,1:60,1,2000:2000:10000);
vrijeme(1:3,1:5)=rez.vrijemeMravljiBlizanac(1:3,1,2000:2000:10000);
bl=min(bl);
%bl=sum(bl);
%bl=bl/3;
for j=1:5
    l=10+j*10;
    i=figure(j);
    plot(bl(1,1:l,j));
    title('Mravlji algoritam "Blizanac"');
    xlabel('Broj iteracija');
    ylabel('Broj dodanih bridova');
    min(bl(1,1:l,j))
    
    ime = dec2base(j,10);
   % min(min(a(1:3,1:l,j)))
    saveas(i,ime,'png');
end
vrijeme=sum(vrijeme);
vrijeme=vrijeme/3
end