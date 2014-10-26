function [x,y,t] = pozoviGenetski_2var(nazivDatoteke,brojGeneracija, brojJedinki, kolikoPokrenuti, elitizam)
ime = dec2base(nazivDatoteke,10);
m=mmread(ime);
m=full(m);
n=length(m);
for i=1:kolikoPokrenuti
    tic
    y(i) = genetski2var(m,brojGeneracija,brojJedinki, elitizam);
    t(i) = toc;
end

x = (1:kolikoPokrenuti);

end