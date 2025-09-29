function fx = lap_pdf(y,mu,sigma)
    fx = 1/(sqrt(2)*sigma)*exp(-sqrt(2)*abs(y-mu)/sigma); 
end