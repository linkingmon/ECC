% Codes for calculating syndrome from receive codeword
% Author : Yu-Cheng Lin 
%          2021. 12. 22 - version 1 

function S_exp = calculate_syndrome(r_exp, print_stat)
    global alpha;
    global m_ary;
    global primitive_order;
    x = alpha.^(1:8).';
    poly_x = x.^(0:m_ary-1);
    poly_coeff = alpha.^r_exp.';
    S_exp = poly_x * poly_coeff;
    if(print_stat) 
        exponent = S_exp.exponent;
        fprintf('======================================== Calculate Syndrome =============================================\n')
        for i_primitive_order = 1 : primitive_order fprintf('S_%d = a^%d\n', i_primitive_order, exponent(i_primitive_order)); end
    end
end