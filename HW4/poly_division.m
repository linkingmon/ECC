% Codes for implementing division of two polynomials
% Author : Yu-Cheng Lin 
%          2021. 12. 25 - version 1 

function Q = poly_division(s_poly, t_poly)
    global md;
    global alpha;
    s_len = length(s_poly.exponent);
    t_len = length(t_poly.exponent); 
    Q = alpha.^nan(1, s_len-t_len+1);
    for i_head = s_len : -1 : t_len
        Q(i_head-t_len+1) = s_poly(i_head) ./ t_poly(t_len);
        s_poly(i_head-t_len+1:i_head) = s_poly(i_head-t_len+1:i_head) + t_poly .* Q(i_head-t_len+1);
    end
end