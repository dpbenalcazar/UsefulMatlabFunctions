function [ out ] = min_max( num , mini , maxi )
% min_max(num, mini, maxi) Limits the value of num between mini and maxi

    if num < mini
        out = mini;
    elseif num > maxi
        out = maxi;
    else
        out = num;
    end

end
