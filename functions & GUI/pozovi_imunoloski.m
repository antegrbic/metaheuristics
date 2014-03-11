function [x,y,t] = pozovi_imunoloski(nazivDatoteke,brojGeneracija, brojJedinki, kolikoPokrenuti)
ime = dec2base(nazivDatoteke,10);
m=mmread(ime);
m=full(m);
for i=1:kolikoPokrenuti
    tic
    y(i) = imunoloski(m,brojGeneracija,brojJedinki,4);
    t(i) = toc;
end

x = (1:kolikoPokrenuti);

end