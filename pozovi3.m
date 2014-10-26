function [x,y]= pozovi3(nazivDatoteke,brojGeneracija, brojMrava, kolikoPokrenuti)

ime = dec2base(nazivDatoteke,10);
m=mmread(ime);
m=full(m);
x=zeros(kolikoPokrenuti,brojGeneracija);
y=zeros(kolikoPokrenuti,1);
for i=1:kolikoPokrenuti
    tic;
    x(i,1:brojGeneracija) = mravlji(m,brojGeneracija,brojMrava);
    y(i) = toc;
end
end