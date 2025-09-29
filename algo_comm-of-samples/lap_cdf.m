function cdf = lap_cdf(y,mu,sigma)
    cdf = 0.5*(1 + sign(y-mu).*(1 - exp( -abs(y-mu)/(sigma/sqrt(2)) )));
end