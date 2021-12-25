% Codes for implementing Berlekamp-Massey decoding
% Author : Yu-Cheng Lin 
%          2021. 12. 23 - version 1 

function [Lambda, L] = BM_decode(S_exp)
    global alpha;
    global m_ary;
    global primitive_order;
    global md;
    
    fprintf('========================================== Run BM Decoding ==============================================\n')
    fprintf('------------------------------------------------------------------------------------------------------------------------------------------\n')
    fprintf('|  r  | delta_r |                 T(X)                 |                 B(X)                 |               Lambda(X)              | L |\n')

    % initialize
    Lambda = alpha.^[0 nan(1,md-1)]; % Lambda(0) is one
    L = 0;
    B = alpha.^[0 nan(1,md-1)];

    % run iteration
    for i_md = 1 : md
        % compute discrepency
        delta = S_exp(i_md);
        for j = 1 : L
            delta = delta + Lambda(j+1) .* S_exp(i_md-j); 
        end
        if(delta.exponent == nan) % no change on the coeff
            B = [alpha^nan B(1:md-1)]; %% overload? concat? what if over md?
        else
            Lambda_pre = Lambda;
            Lambda = Lambda + delta .* [alpha^nan B(1:md-1)];
            if(2*L <= i_md-1)
                L = i_md - L;
                B = Lambda_pre./delta; 
            else
                B = [alpha^nan B(1:md-1)];
            end
        end    
        fprintf('|  %d  |   a^%2d  | %s | %s | %s | %d |\n', ...
            i_md, delta.exponent, poly_str(Lambda, 36), poly_str(B, 36), poly_str(Lambda, 36), L)
    end
    fprintf('------------------------------------------------------------------------------------------------------------------------------------------\n')
end


