% Codes for calculating the reversed-LUT for polnomial expression to exponent expression
% Author : Yu-Cheng Lin 
%          2021. 12. 23 - version 1 

function LUT_reverse = reverse_LUT(LUT)
    LUT_reverse = zeros(size(LUT,1),1);
    LUT_reverse(bi2de(LUT)+1) = 1:size(LUT,1);
end