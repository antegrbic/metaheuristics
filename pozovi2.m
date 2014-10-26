function [x,y] = pozovi2(nazivDatoteke,brojGeneracija, brojJedinki, kolikoPokrenuti)

ime = dec2base(nazivDatoteke,10);
m=mmread(ime);
m=full(m);
x=zeros(kolikoPokrenuti,brojGeneracija);
y=zeros(kolikoPokrenuti,1);
for i=1:kolikoPokrenuti
    tic;
    [x(i,1:brojGeneracija),~] = genetski2(m,brojGeneracija,brojJedinki);
    y(i)=toc;
end
end