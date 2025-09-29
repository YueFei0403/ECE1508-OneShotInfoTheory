function Finv = lap_invcdf(y,mu,sigma)
    b = sigma / sqrt(2);
    Finv = mu - b*sign(y - 0.5)*log(1-2*abs(y-0.5));
end
