function [x,y,t] = pozoviGenetski_2(nazivDatoteke,brojGeneracija, brojJedinki, kolikoPokrenuti)
ime = dec2base(nazivDatoteke,10);
m=mmread(ime);
m=full(m);
for i=1:kolikoPokrenuti
    tic
    y(i) = genetski2(m,brojGeneracija,brojJedinki);
    t(i) = toc;
end

x = (1:kolikoPokrenuti);

end