function [brZajBridova] = nadjiPresjek( roditelj1, roditelj2 )

n = length(roditelj1);

brZajBridova = 0;
%%zajednicki_bridovi = zeros(2,1);

for i=1:n
    R = 0;
    for j=1:n
        if(roditelj1(i) == roditelj2(j))
            if(j == n)
                    R = roditelj2(1);
                    break;
            else 
                R = roditelj2(j+1);
                break;
            end
        end
    end
    
    if (i==n)
        if (roditelj1(1) == R)
            brZajBridova = brZajBridova + 1;
            %%zajednicki_bridovi(1,brZajBridova) = roditelj1(i);
            %%zajednicki_bridovi(2,brZajBridova) = R;
        end
    else
        if (roditelj1(i+1) == R)
            brZajBridova = brZajBridova + 1;
            %%zajednicki_bridovi(1,brZajBridova) = roditelj1(i);
            %%zajednicki_bridovi(2,brZajBridova) = R;
        end
    end
end
                

end

