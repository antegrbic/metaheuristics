function [x,y,t] = pozovi_mravlji_v2(nazivDatoteke,brojGeneracija, brojMrava, kolikoPokrenuti)

ime = dec2base(nazivDatoteke,10);
m=mmread(ime);
m=full(m);
n=length(m);
for i=1:kolikoPokrenuti
    tic;
    [y(i),~] = mravljiBlizanac(m,brojGeneracija,brojMrava);
    x(i) = i;
    t(i)=toc;
end

end