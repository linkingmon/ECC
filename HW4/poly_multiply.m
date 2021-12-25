% Codes for implementing multiplication of two polynomials
% Author : Yu-Cheng Lin 
%          2021. 12. 25 - version 1 

function st_poly  = poly_multiply(s_poly, t_poly)
    global md;
    global alpha;
    s_len = length(s_poly.exponent);
    t_len = length(t_poly.exponent); 
    st_poly = alpha.^nan(1, s_len+t_len-1);
    for i_s = 1 : s_len
        for i_t = 1 : t_len
            st_poly(i_s+i_t-1) = st_poly(i_s+i_t-1) + s_poly(i_s) .* t_poly(i_t);
        end
    end
end