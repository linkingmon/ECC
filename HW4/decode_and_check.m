% Codes for decoding the codeword and check if it is a valid RS codeword
% Author : Yu-Cheng Lin 
%          2021. 12. 24 - version 1 

function v = decode_and_check(r_exp, e_exp)
    global alpha;
    global md;

    %% receive codeword
    v = alpha.^r_exp + alpha.^e_exp;

    %% check codeword
    check_exp = calculate_syndrome(v.exponent, 0);
    fprintf("The decode codeword is: %s\n", poly_str(v, 30))
    if(sum(isnan(check_exp.exponent)) == md) fprintf("[Decode Success!]\n");
    else fprintf("[Decode Error, not a codeword!]\n"); end
end