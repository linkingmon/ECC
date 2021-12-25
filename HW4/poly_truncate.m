% Codes for truncating polynomial to the higest degree
% Author : Yu-Cheng Lin 
%          2021. 12. 25 - version 1 

function t_poly  = poly_truncate(t_poly)
    global alpha;
    global md;

    highest_degree = nan;
    exponent = t_poly.exponent;
    for i_power = length(t_poly.exponent) : -1 : 1 
        cur_coeff = exponent(i_power);
        if(~isnan(cur_coeff)) highest_degree = i_power; t_poly = t_poly(1:highest_degree); break; end
    end
end