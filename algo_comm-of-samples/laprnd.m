function x = laprnd(mu,sigma,N)
if nargin <= 2
    u = rand() -0.5;
    b = sigma / sqrt(2);
    x = mu - b * sign(u).* log(1- 2*abs(u));
else 
    u = rand(N,1) -0.5;
    b = sigma / sqrt(2);
    x = mu - b * sign(u).* log(1- 2*abs(u));
end
end