function n_optim = ORC(x,sigma,N)
    stddev = sqrt(sigma^2 + 1);
    W = laprnd(x,sigma,N);
    a = zeros(N,1);
    
    for k=1:N
        wk = W(k);
        fx = q_MRC(x,wk,stddev);
        gx = lap_pdf(wk,x,stddev);
        Gn = evrnd(0,1); 
        a(k) = log2(fx) - log(gx) + Gn;
    end
    [~,n_optim] = max(a);
end