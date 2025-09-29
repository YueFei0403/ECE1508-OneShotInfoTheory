function fx = q_MRC(y,mu,sigma)
    beta = 3;
    fx = beta/2*gamma(beta)*exp(- (sqrt(2)*abs(y-mu)/sigma)^beta ); 
end