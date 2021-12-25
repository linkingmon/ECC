% Codes for implementing Euclidean Decoding
% Author : Yu-Cheng Lin 
%          2021. 12. 25 - version 1 

function [Lambda] = E_decode(S_exp)
    global md;
    global alpha;
    % initialization
    s_poly = alpha.^[nan(1, md) 0];
    t_poly = S_exp.';
    A11 = alpha.^0;
    A12 = alpha.^nan;
    A21 = alpha.^nan;
    A22 = alpha.^0;
    Lambda = nan;

    %% truncate poly
    t_poly = poly_truncate(t_poly);
    fprintf('=========================================== Run E Decoding ==============================================\n')
    fprintf('Euclidean decoding algorithm \n');
    fprintf('-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------\n')
    fprintf('| r ')
    fprintf('|                                 s(X)                                   ')
    fprintf('|                        t(X)                           ')
    fprintf('|             Q(X)           ')
    fprintf('|                 A11(X)               ')
    fprintf('|                 A12(X)               ')
    fprintf('|                 A21(X)               ')
    fprintf('|                 A22(X)               |\n')
    for i_md = 1 : md
        %% calculate Q
        Q_poly = poly_division(s_poly, t_poly);

        %% update A
        A11_pre = A11; A12_pre = A12;
        A11 = A21; A12 = A22;
        
        QA21_poly = poly_multiply(Q_poly, A21);
        QA22_poly = poly_multiply(Q_poly, A22);
        A21 = [A11_pre alpha.^nan(1,length(QA21_poly.exponent)-length(A11_pre.exponent))] + QA21_poly;
        A22 = [A12_pre alpha.^nan(1,length(QA22_poly.exponent)-length(A12_pre.exponent))] + QA22_poly;

        %% update s_poly & t_poly
        s_poly_pre = s_poly;
        Qt_poly = poly_multiply(Q_poly, t_poly);
        s_poly = t_poly;
        t_poly = [s_poly_pre alpha.^nan(1,length(Qt_poly)-length(s_poly_pre))] + Qt_poly;

        %% update Lambda
        delta = A22(1);
        Lambda = A22 ./ delta;

        %% truncate poly and check condition
        s_poly = poly_truncate(s_poly); t_poly = poly_truncate(t_poly);
        fprintf("| %d | %s | %s | %s | %s | %s | %s | %s |\n", ...
            i_md, poly_str(s_poly,70), poly_str(t_poly,53), poly_str(Q_poly,26), poly_str(A11,36), poly_str(A12,36), poly_str(A21,36), poly_str(A22,36));
        if(length(t_poly.exponent) <= md/2) break; end
    end
    fprintf('-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------\n')
    Lambda = [Lambda alpha.^nan(1,md-length(Lambda.exponent))];
end