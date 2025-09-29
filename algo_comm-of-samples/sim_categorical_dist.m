clc;
clear all;
close all;


D = 2^6;
alpha = 3*10e-2;
N = 1000;
figure
diriR = drchrnd(D,alpha,N);
targetD=histogram(diriR);

sigma = 1;
prop_RS_greedy = zeros(N,1);
for n=1:N
    prop_RS_greedy(n)=RS_greedy()
end





% surf(diriR(1:32,1:32));
% 
% figure
% diriR2 = drchrnd2(alpha.*ones(1,D),N);
% surf(diriR2(1:32,1:32));


function r = drchrnd(D,alpha,N)
    % take a sample from a dirichlet distribution
    r = gamrnd(alpha,1,D,N);
    r = r ./ sum(r,1); 
end

% function r = drchrnd2(a,n)
% % take a sample from a dirichlet distribution
% p = length(a);
% r = gamrnd(repmat(a,n,1),1,n,p);
% r = r ./ repmat(sum(r,2),1,p);
% end