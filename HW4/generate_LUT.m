% Codes for calculating the LUT for exponent expression to polnomial expression
% Author : Yu-Cheng Lin 
%          2021. 12. 23 - version 1 

function LUT = generate_LUT(primitive_order, primitive_poly)
    LUT = zeros(2^primitive_order,primitive_order);
    row = 2^primitive_order;
    LUT(2,1) = 1;
    for i_row = 3 : row
        LUT(i_row,:) = [false LUT(i_row-1,1:primitive_order-1)];
        if(LUT(i_row-1,primitive_order) == 1) LUT(i_row,:) = mod(LUT(i_row,:) + primitive_poly(1:primitive_order),2); end
    end
end