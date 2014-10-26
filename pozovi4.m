function [x,y] = pozovi4(nazivDatoteke, brojGeneracija, brojMrava, kolikoPokrenuti)

ime = dec2base(nazivDatoteke,10);
m=mmread(ime);
m=full(m);
%n=length(m);
x=zeros(kolikoPokrenuti,brojGeneracija);
y=zeros(kolikoPokrenuti,1);
%y=zeros(n,kolikoPokrenuti);
for i=1:kolikoPokrenuti
    tic;
    x(i,1:brojGeneracija) = mravljiBlizanac(m,brojGeneracija,brojMrava);
    y(i)=toc;
end
end