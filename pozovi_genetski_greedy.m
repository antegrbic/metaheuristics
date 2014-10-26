function [x,y,t] = pozovi_genetski_greedy(nazivDatoteke,brojGeneracija, brojJedinki, kolikoPokrenuti)

ime = dec2base(nazivDatoteke,10);
m=mmread(ime);
m=full(m);
for i=1:kolikoPokrenuti
    tic
    y(i) = genetskiGreedy(m,brojGeneracija,brojJedinki);
    t(i) = toc;
end

x = (1:kolikoPokrenuti);

end