clc;
clear all;
close all;


Rate=4:1:16; %rate
M =length(Rate);
nSamples = 2.^Rate;
var_y = ones(1,M);
e = exp(1);
lambda = 0.01;
rho = 0.95;
Risk_lowerB = zeros(1,M);
Risk_upperB = zeros(1,M);
Risk_PFR = zeros(1,M);

Trials=1000;
for i=1:M
    n = nSamples(i);
    tmp_riskL = 0;
    tmp_riskU = 0;
    tmp_riskPFR = 0;
    for t=1:Trials
        x = genX(n);
        y = genY(x,rho);
        Cxy = 0.95;
        varx = var(x);
        vary = var(y);
        c = 0.95^2;
        a = 1-(lambda*log(e))/(2*c);
        if (lambda*log(e))/(2*c) >1
            disp("error")
        end
        sigmaz = lambda*a*log2(e)/c;
        z_rnd = normrnd(0,sigmaz,size(y));
        y_hat = Cxy'*x/varx ;
        gamma = mean((y-y_hat).^2);
        
%         I_XY = 0.5*log2(c) - 0.5*log2(gamma);
        I_XY =  0.5*log2(2*c / (lambda*log2(e)));
        if n==1
            tmp_riskL = vary - c;
        else 
            tmp_riskL = tmp_riskL + vary - c + gamma + lambda*I_XY;
            tmp_riskU = tmp_riskU + vary - c + gamma + lambda*(I_XY + 2*log2(I_XY+1)+3.732);
            tmp_riskPFR = tmp_riskPFR + vary - c + gamma + lambda*(I_XY + log2(I_XY+1)+3.732);
        end
        Risk_lowerB(i) = tmp_riskL/Trials;
        Risk_upperB(i) = tmp_riskU/Trials;
        Risk_PFR(i) = tmp_riskPFR/Trials;
    end
    disp(Risk_lowerB(i))
end
figure
plot(Risk_PFR,Rate,'-o','LineWidth',1,'DisplayName','PFRL Bound')
hold on
plot(Risk_lowerB,Rate,'-.','LineWidth',1,'DisplayName','Lower Bound')
hold on
plot(Risk_upperB,Rate,'LineWidth',1,'DisplayName','Upper Bound')

legend show
xlabel("Risk")
ylabel("Rate")
title("Rate vs risk in rate-constrained minimax linear regression")
grid on



function X=genX(N)
    X = normrnd(0,1,N,1);
end

function Y=genY(X,rho)
    Z = normrnd(0,1,size(X));
    Y = rho.*X + sqrt((1-rho^2)).*Z;
end






