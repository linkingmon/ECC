% Codes for finding the error location and error magnitude
% Author : Yu-Cheng Lin 
%          2021. 12. 24 - version 1 

function e_exp = find_err(Lambda, S_exp, print_stat)
    global alpha;
    global m_ary;
    global md;
    x = alpha.^(0:m_ary-1).';
    poly_x = x.^[0:length(Lambda.exponent)-1];
    
    fprintf('================================== Find error location & magnitude ======================================\n')
    % find error locations (Chein's search)
    e_val = poly_x * Lambda.';
    exponent = e_val.exponent;
    idx_ary = 0:m_ary-1;
    error_location = idx_ary(isnan(exponent));
    X = alpha.^(-error_location);
    
    % find error magnitude (Forney Algorithm)
    omega = calculate_omega(S_exp.', Lambda).';
    Y = alpha.^(nan(1,length(error_location)));
    for i_error = 1 : length(error_location)
        mult_temp = alpha^0;
        for j_error = 1: length(error_location)
            if(j_error ~= i_error) 
                mult_temp = mult_temp .* (alpha^0 + X(j_error) ./ X(i_error)); 
            end
        end
        Y(i_error) = ((alpha^0./X(i_error)).^(0:md-1) * omega) ./ (X(i_error) .* mult_temp);
    end
    X_exp = X.exponent;
    Y_exp = Y.exponent;
    if(print_stat)
        fprintf('----------------------\n')
        fprintf('| Locate | Magnitude |\n')
        for i_error = 1 : length(error_location) 
            fprintf('|  %4s  |    %4s   |\n', sprintf('X^%d',X_exp(i_error)), sprintf('a^%d',Y_exp(i_error)));
        end 
        fprintf('----------------------\n')
    end
    e_exp = nan(1,m_ary);
    e_exp(X_exp+1) = Y.exponent;
end