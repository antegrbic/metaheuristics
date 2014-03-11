function [ podjela, brojac] = dodaj_brid( podjela, brojac, temp)

dodao = 0;

if(brojac == 0)
    
    brojac = brojac + 1;
    podjela{brojac} = temp;
    dodao=1;
    return;
    
elseif(brojac ~= 0)
    
    for j=1:brojac
        if (podjela{j}(1) == temp(1,1))
            podjela{j} = [temp(1,2) podjela{j} ];
            dodao = 1;
            return;
        elseif(podjela{j}(length(podjela{j})) == temp(1,1))
            k = find(podjela{j} == temp(1,2));
            if (k >0) return;
            else
                podjela{j} = [podjela{j} temp(1,2)];
                dodao = 1;
                return;
            end
        end
    end
    
    for j=1:brojac
        if (podjela{j}(1) == temp(1,2))
                podjela{j} = [temp(1,1) podjela{j} ];
                dodao = 1;
                return;
            elseif(podjela{j}(length(podjela{j})) == temp(1,2))
                k = find(podjela{j} == temp(1,1));
                if (k >0) return;
                else
                    podjela{j} = [podjela{j} temp(1,1)];
                    dodao = 1;
                    return;
                end
        end  
    end
   
end

if(dodao == 0)
    
    brojac = brojac + 1;
    podjela{brojac} = temp;
    
end
            

end

