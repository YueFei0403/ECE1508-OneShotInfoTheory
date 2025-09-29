clc
clear all
close all

sigma = 10;
Ncandidates = [1 4 16 64 256 1024 4096 16384];
N = length(Ncandidates);
M = 101;
n_star = zeros(N,1);
n_temp = zeros(M,1);

for i=1:N
    for j=1:M
        Nmax = Ncandidates(i);
        x = randn*sigma; %X ∼ N (0, σ^2)
        n_temp(j) = hybrid_coding(x,sigma,Nmax);
    end
    n_star(i) = median(n_temp);
end

figure 
plot(Ncandidates,log2(n_star'),'Color','#494f5f','LineWidth',1.5)
xticklabels({'2^0','2^2','2^4','2^6','2^8','2^{10}','2^{12}','2^{14}'})
hold on; grid on

xlabel('Number of candidates [N]')
ylabel('Coding cost [bit]')
title('Computational Cost of Communicating One Sample')
hold off 


