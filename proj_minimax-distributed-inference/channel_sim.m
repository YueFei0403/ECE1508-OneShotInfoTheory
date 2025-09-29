clc;
clear all;
close all;


N = 10;
Cxy = 0.95;
var_x = 1; var_y = 1;
a = 1 - (log2(exp(1))) / (2*0.95^2);
sigma_z = sqrt(a*log2(exp(1)) /2);
for n=1:N
    x = PFR();
    z = norm(0,sigma_z);
    y_hat = Cxy*x 
%     encoded = elias_delta_enc(x);
%     decoded = elias_delta_dec(encoded);
%     disp("==== Current Pair ====")
%     fprintf("x = %d\n", x)
%     disp(encoded)
%     disp(decoded)
end


