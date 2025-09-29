function [n_optim,M_avg] = PFR_coding(x,sigma,N)
    t = 0;
    n = 1;
    s_optim = Inf;
    n_optim = 0;
    wmin = 0;
    stddev = sqrt(sigma^2+1);
    M_avg = 0;

    while (s_optim > t*wmin && n < N)
        z = randn*x;
        t = t + exprnd(1);
        pz = lap_pdf(z,x,stddev);
        [qz,M] = q(x,z,sigma);
        s = t*(pz/qz);
        M_avg = M_avg + M;
        
        if s < s_optim 
            s_optim = s;
            n_optim = n;
        end
        n = n + 1;
        wmin = compute_wmin(x,sigma);
    end
end
