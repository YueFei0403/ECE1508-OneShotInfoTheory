function [n_optim] = RS_greedy(x,sigma,N)
    n = 0;
    q_prim = 0;
    n_optim = 0;
    while 1 
        n = n+1;
        z = laprnd(x,sigma);
        pz = lap_pdf(z,x,sigma);
        p_prim = (1-sum(q_prim))*pz;
        qz = q(z,x,sigma);
        a = min(1,(qz-q_prim)/p_prim);
        q_prim = q_prim + a*p_prim;

        if (rand() < a || n >= N)
            n_optim = n;
            break
        end
    end
end

