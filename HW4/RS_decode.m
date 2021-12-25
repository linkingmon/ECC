% Codes for implementing two decoding algorithms for Reed-Solomon Codes
% Author : Yu-Cheng Lin 
%          2021. 12. 25 - version 1 

clear, clc;

%%%%%%%%%%%%%%%%%%%%%%%% Initialize %%%%%%%%%%%%%%%%%%%%%%%%%
global primitive_order;
global m_ary;
global LUT;
global LUT_reverse;
global alpha;
global md;

%% set result to file via diary
filename_save = 'result.txt'
if exist(filename_save, 'file') ; delete(filename_save); end
diary(filename_save);

%% Set initial parameter
primitive_order = 6;
primitive_poly = [1 1 zeros(1,4) 1];
print_stat = 1;
md = 8;

%% Initialize the table for converting the field element between poly and exp
m_ary = 2^6 - 1;
LUT = generate_LUT(primitive_order, primitive_poly);
LUT_reverse = reverse_LUT(LUT);
alpha = Alpha(1);

%%%%%%%%%%%%%%%%%%%%%%%%% Problem 1 %%%%%%%%%%%%%%%%%%%%%%%%%
print_problem(1);

% received sequence
r_exp = [36 34 nan(1,2) 56 52 47 13 39 0 5 nan(1,12) 11 nan(1,36) 37 nan(1,2)];

% calculate syndrome
S_exp = calculate_syndrome(r_exp, print_stat);

% run BM decoding
[Lambda, L] = BM_decode(S_exp);

% Find error magnitude
e_exp = find_err(Lambda, S_exp, print_stat);

% check decoding correctness
v = decode_and_check(r_exp, e_exp);

%%%%%%%%%%%%%%%%%%%%%%%%% Problem 2 %%%%%%%%%%%%%%%%%%%%%%%%%
print_problem(2);

% run E decoding
Lambda = E_decode(S_exp);

% Find error magnitude
e_exp = find_err(Lambda, S_exp, print_stat);

% check decoding correctness
v = decode_and_check(r_exp, e_exp);

%%%%%%%%%%%%%%%%%%%%%%%%% Problem 3 %%%%%%%%%%%%%%%%%%%%%%%%%
print_problem(3);

% received sequence
r_exp = [nan(1,1) 34 nan(1,3) 52 0 nan(1,16) 11 nan(1,36) 37 nan(1,2)];

% calculate syndrome
S_exp = calculate_syndrome(r_exp, print_stat);

% run BM decoding
[Lambda, L] = BM_decode(S_exp);


% Find error magnitude
e_exp = find_err(Lambda, S_exp, print_stat);

% check decoding correctness
v = decode_and_check(r_exp, e_exp);

%%%%%%%%%%%%%%%%%%%%%%%%% Problem 4 %%%%%%%%%%%%%%%%%%%%%%%%%
print_problem(4);

% run E decoding
Lambda = E_decode(S_exp);

% Find error magnitude
e_exp = find_err(Lambda, S_exp, print_stat);

% check decoding correctness
v = decode_and_check(r_exp, e_exp);

%% close diary
diary off;


function print_problem(idx)
    fprintf('\n/////////////////////////////////////////////////////////////////////////////////////////////////////////\n')
    fprintf('//                                                                                                     //\n')
    fprintf('//                                             Problem %d                                               //\n', idx)
    fprintf('//                                                                                                     //\n')
    fprintf('/////////////////////////////////////////////////////////////////////////////////////////////////////////\n')
end