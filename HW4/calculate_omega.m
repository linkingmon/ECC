% Codes for calculating the polynomial omega used in the Forney algorithm
% Author : Yu-Cheng Lin 
%          2021. 12. 22 - version 1 

function omega = calculate_omega(S_exp, Lambda)
    global md;
    global alpha;
    omega = alpha.^(nan(1,2*md));
    for i_md1 = 1 : md
        for i_md2 = 1 : md
            omega(i_md1+i_md2-1) = omega(i_md1+i_md2-1) + S_exp(i_md1) .* Lambda(i_md2);
        end
    end
    omega = omega(1:md);
end