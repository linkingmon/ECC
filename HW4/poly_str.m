% Codes for converting a string from its polynomial coefficient
% Author : Yu-Cheng Lin 
%          2021. 12. 23 - version 1 

function str_out = poly_str(obj_in, str_len)
    exponent = obj_in.exponent;
    str_ary = {};
    idx = 1;
    for i_i = 1 : length(exponent)
        if(~isnan(exponent(i_i))) 
            str_ary{idx} = sprintf('a^%d',exponent(i_i)); 
            idx = idx + 1; 
        end
    end
    exp_ary = 0:length(exponent)-1;
    exp_ary = exp_ary(~isnan(exponent));
    if(length(str_ary) == 0)
        str_out = '0';
    elseif(length(str_ary) == 1) 
        if(exp_ary(1) == 0) str_out = str_ary{1};
        else str_out = [str_ary{1} sprintf('X^%d',exp_ary(1))]; end
    else
        if(exp_ary(1) == 0) str_out = str_ary{1};
        else str_out = [str_ary{1} sprintf('X^%d',exp_ary(1))]; end
        for i_idx = 2 : length(str_ary)
            str_out = [str_out '+' str_ary{i_idx} sprintf('X^%d',exp_ary(i_idx))];
        end
    end
    str_rem = str_len - length(str_out);
    str_rem_l = floor(str_rem/2);
    str_rem_r = str_rem - str_rem_l;
    str_out = [repmat(' ', [1 str_rem_l]) str_out repmat(' ', [1 str_rem_r])];
end