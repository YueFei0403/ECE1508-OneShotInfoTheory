clc
clear all
close all

std_dev = 0:5:50;
Ntrials = length(std_dev);
Mtrials = 51; % to make median an integer
n_star_Hybrid = zeros(Ntrials,1);
n_star_PFR = zeros(Ntrials,1);
n_star_PFR_Q1 = zeros(Ntrials,1);
n_star_PFR_Q4 = zeros(Ntrials,1);
for i=1:Ntrials
    n_val_Hybrid = zeros(Mtrials,1);
    M_val_Bybrid = zeros(Mtrials,1);
    n_val_PFR = zeros(Mtrials,1);
    M_val_PFR = zeros(Mtrials,1);
    for j=1:Mtrials
        sigma = std_dev(i);
        x = randn*sigma; %X ∼ N (0, σ^2)

        [n_optim_Hybrid, k_optim, M_avg_Hybrid] = hybrid_coding(x,sigma);
        n_val_Hybrid(j,1) = n_optim_Hybrid; 
        M_val_Bybrid(j,1) = M_avg_Hybrid;
        [n_optim_PFR, M_avg_PFR] = PFR_coding(x,sigma);
        n_val_PFR(j,1) = n_optim_PFR; 
        M_val_PFR(j,1) = M_avg_PFR;
    end
   
    n_star_Hybrid(i) = median(n_val_Hybrid,1);
    n_star_PFR(i) = median(n_val_PFR,1);
    n_star_PFR_Q1(i) = prctile(n_val_PFR,25,1);
    n_star_PFR_Q4(i) = prctile(n_val_PFR,75,1);
end

figure 
plot(std_dev,n_star_PFR','Color','#494f5f','LineWidth',1.5)
hold on; grid on
plot(std_dev,n_star_Hybrid','Color','#339900','LineWidth',1.5)


x2 = [std_dev,fliplr(std_dev)];
inbetween = [n_star_PFR_Q1',flip(n_star_PFR_Q4)'];
p=fill(x2, inbetween, [0.7 0.8 1],'FaceAlpha',0.3);
p.EdgeColor = "none";
legend('PFR','Hybrid','Prctile [25 75]')
xlabel('$\sigma$','fontsize',14,'interpreter','latex')
ylabel('Number of Iterations (median)')
title('Computational Cost of Communicating One Sample')
hold off 


