function [x,y] = pozovi5(nazivDatoteke, brojGeneracija, brojJedinki, kolikoPokrenuti)

ime = dec2base(nazivDatoteke,10);
m=mmread(ime);
m=full(m);
x=zeros(kolikoPokrenuti,brojGeneracija);
y=zeros(kolikoPokrenuti,1);
for i=1:kolikoPokrenuti
    tic;
    x(i,1:brojGeneracija) = imunoloski(m,brojGeneracija,brojJedinki,5);
    y(i)=toc;
end
end