function n_opt=PFR()
    t = 0;
    n = 1;
    s_opt = inf;
    wmin = 1;
    n_opt = 1;
    
    while 1
        x = randn();
        t = t + exprnd(1);
        s = t*y_pdf(x)/normpdf(x);
        
        if s < s_opt
            s_opt = s;
            n_opt = n;
        end
        n = n+1;
        if (s_opt <= t*wmin)
            break
        end
    end
    
end

function fy = y_pdf(x)
    rho = 0.95;
    w = randn; %randomness at Y
    gw = rho*x + sqrt(1-rho^2)*w; %now correlated with x
    fy = normpdf(gw);
end