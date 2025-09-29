function [n_optim, k_optim, M_avg] = hybrid_coding(x,sigma,Nmax)
    % output 
    n_optim = 0;
    k_optim = 0;
    
    % local vars
    c = 0.5;
    t = 0;
    n = 1;
    s_optim = Inf;
    wmin = 0;
    M_avg = 0;
   
    
    while s_optim > t*wmin && n<=Nmax
        u = unifrnd(0,1);
        k = round(c-u);
        z = k + u;
        
        v = 1;
        t = t + v*exprnd(1);
        [qz,M] =  q(x,z,sigma);
        s = t / qz;
        M_avg = M_avg + M;
        
        if (s < s_optim)
            s_optim = s;
            n_optim = n;
            k_optim = k;
        end
        n = n + 1;
        wmin = compute_wmin(x,sigma);
    end
    M_avg = M_avg/n;
end
