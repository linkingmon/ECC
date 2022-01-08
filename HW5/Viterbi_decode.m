% Codes for implementing viterbi decoding algorithms with trunction and quantization techniques
% Author : Yu-Cheng Lin 
%          2021. 12. 29 - version 1 

clear, clc;

%%%%%%%%%%%%%%%%%%%%%%%% Initialize %%%%%%%%%%%%%%%%%%%%%%%%%
g = [23 35];        % generator matrix
m = 4;              % memory order
r = 1/2;            % code rate
EbN0 = 2:0.5:5;     % Eb / N0
Q = [2 4 8];        % # quantization block


filename_save = 'result.txt';
if exist(filename_save, 'file') ; delete(filename_save); end
%% set result to file via diary
diary(filename_save);

%%%%%%%%%%%%%%%%%%%%%%%%% Problem 1 %%%%%%%%%%%%%%%%%%%%%%%%%
tic;
tau = 32;           % memory order
min_ber = 1e-5;
min_error = 500;
print_problem(1);
run_simulation(g, m, r, EbN0, Q, tau, min_error, min_ber, 'p1.jpg');
toc;

%%%%%%%%%%%%%%%%%%%%%%%%% Problem 2 %%%%%%%%%%%%%%%%%%%%%%%%%
tic;
tau = 12;           % memory order
min_ber = 1e-4;
min_error = 500;
print_problem(2);
run_simulation(g, m, r, EbN0, Q, tau, min_error, min_ber, 'p2.jpg');
toc;

%% close diary
diary off;


function run_simulation(g, m, r, EbN0, Q, tau, min_error, min_ber, fig_name)
    Eb = 1;
    N0 = 2 ./ db2pow(EbN0);
    BER = zeros(numel(Q),numel(EbN0));
    col = {[0.6 0.2 0], [0.2 0.4 1], 'black', [0.3 0.4 0], [0.5 0.3 0.1]};
    mark = {'-^', '-s', '-o', '->', '-^'};
    trellis = poly2trellis(m+1, g);

    for i_Q = 1 : numel(Q)
        switch Q(i_Q)
            case 2
                partition = [0];
                codebook = 1:-1:0;
            case 4
                partition = [-sqrt(Eb) 0 sqrt(Eb)];
                codebook = 3:-1:0;
            case 8
                partition = [-1.5*sqrt(Eb) -sqrt(Eb) -0.5*sqrt(Eb) 0 0.5*sqrt(Eb) sqrt(Eb) 1.5*sqrt(Eb)];
                codebook = 7:-1:0;
        end

        n_bit = 100;
        max_sim_time = min_error/min_ber/n_bit;
        total_trans_num = round(linspace(500, max_sim_time, numel(EbN0)));

        for i_EbN0 = 1 : numel(EbN0)
            err_sum = 0;
            for i_i = 1 : total_trans_num(i_EbN0)
                x = randi(2,n_bit,1) - 1;
                code = convenc(x,trellis);
                s = (1-2*code).*sqrt(Eb);
                r = s + sqrt(N0(i_EbN0)/2) * randn(size(s));
                [index, quants] = quantiz(r, partition, codebook);
                decoded = vitdec(quants.', trellis, tau, 'cont', 'soft', log2(Q(i_Q)) );
                err_sum = err_sum + biterr(x(1:end-tau), decoded(tau+1:end));
            end
            BER(i_Q,i_EbN0) = err_sum / total_trans_num(i_EbN0) / n_bit;
        end
    end

    fprintf("| EbN0 (dB) |  Q = 2   |  Q = 4   |  Q = 8   |\n")
    for i_EbN0 = 1 : numel(EbN0)
        fprintf("|    %1.1f    |", EbN0(i_EbN0))
        for i_Q = 1 : numel(Q)
            fprintf(" %f |", BER(i_Q,i_EbN0))
        end
        fprintf("\n")
    end

    figure;
    hold on
    set(gca, 'YScale', 'log');
    ylim = [1e-1 min_ber];
    for i_Q = 1 : numel(Q)
        plot(EbN0,BER(i_Q,:), mark{i_Q}, 'LineWidth', 2.5, 'Color', col{i_Q}, 'MarkerSize', 8, 'MarkerFaceColor', 'w')
    end
    grid on
    legend('Q=2','Q=4','Q=8','location','northeast')
    title(['(2,1,4) convolution code with truncation length = ' num2str(tau)])
    xlabel('Eb/N0 (dB)')
    ylabel('Bit Error Rate (BER)')
    saveas(gcf, fig_name)
end


function print_problem(idx)
    fprintf('\n/////////////////////////////////////////////////////////////////////////////////////////////////////////\n')
    fprintf('//                                                                                                     //\n')
    fprintf('//                                             Problem %d                                               //\n', idx)
    fprintf('//                                                                                                     //\n')
    fprintf('/////////////////////////////////////////////////////////////////////////////////////////////////////////\n')
end