function [ out ] = min_max( num , minimo , maximo )
%min_max Limita la entrasa num entre los valores mínimo y maximo

    if num < minimo
        out = minimo;
    elseif num > maximo
        out = maximo;
    else
        out = num;
    end

end

