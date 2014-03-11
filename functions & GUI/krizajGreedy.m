function [ dijete1, dijete2 ] = krizajGreedy( roditelj1, roditelj2, n )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

presjek = nadjiPresjek(roditelj1, roditelj2);
empty = find(roditelj1 == 0);

preostali = roditelj1;

dijete1 = roditelj1;
dijete2 = roditelj2;
kolikoGenerirati = 0;

for i=1:n
    t = 0;
    for k=1:length(presjek)
        if (presjek(k) == roditelj1(i))
            t = 1;
        end
    end
    
    if (t == 0)
        dijete1(i) = 0;
    end
    
    t = 0;
     for k=1:length(presjek)
        if (presjek(k) == roditelj2(i))
            t = 1;
        end
    end
    if (t == 0)
        dijete2(i) = 0;
    end
end

kolikoGenerirati = n - length(presjek);

for i=1:length(presjek)
    tempDuljina = length(preostali);
    j = find(preostali == presjek(i));
    
    for k=j:(length(preostali) - 1)
        preostali(k) = preostali(k+1);
    end
    
    preostali = preostali(1,1:tempDuljina-1);    
end

preostali1 = preostali;

zaustavljanje = 0;
iskoristeni = find(roditelj1 == 0);

for i=1:n
        if (dijete1(i) == 0)
        while(zaustavljanje == 0)
            zaustavljanje = 0;
            r = randi([1,n],1,1);

            t1 = 0;
            for k=1:length(presjek)
                if (r == presjek(k))
                    t1 = 1;
                end
            end

            t2 = 0;
            for k=1:length(iskoristeni)
                if (r == iskoristeni(k))
                    t2 = 1;
                end
            end

            if (t1 == 0 && t2 == 0)
                j = find(preostali == r);
                dijete1(i) = r;
                zaustavljanje = 1;
            end
        end

        zaustavljanje = 0;
        end
end

zaustavljanje = 0;
iskoristeni = find(roditelj1 == 0);

for i=1:n
    if (dijete2(i) == 0)
        while(zaustavljanje == 0)
            zaustavljanje = 0;
            r = randi([1,n],1,1);
            t1 = 0;
            for k=1:length(presjek)
                if (r == presjek(k))
                    t1 = 1;
                end
            end

            t2 = 0;
            for k=1:length(iskoristeni)
                if (r == iskoristeni(k))
                    t2 = 1;
                end
            end

            if (t1 == 0 && t2 == 0)
                j = find(preostali1 == r);
                preostali1(j) = 0;
                dijete2(i) = r;
                zaustavljanje = 1;
            end
        end

        zaustavljanje = 0;
    end
end           

end

