function wmin = compute_wmin(x,sigma)
    theta = 10e-4;
    zmin = (sigma^2 + 1)/(sigma^2) * x;
    
    pd = lap_pdf(zmin,0,sqrt(sigma^2+1));
    qd = lap_pdf(zmin,x,1);
    
    wmin = (1-theta)*pd/qd;
end