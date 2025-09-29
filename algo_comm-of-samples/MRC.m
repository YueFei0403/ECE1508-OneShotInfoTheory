function n_optim = MRC(x,sigma,N)
    stddev = sqrt(sigma^2 + 1);
    W = laprnd(x,sigma,N);
    a = zeros(N,1);
    
    for k=1:N
        wk = W(k);
        fx = q_MRC(x,wk,stddev);
        gx = lap_pdf(wk,x,stddev);
        a(k) = fx / gx;
    end
    denom = sum(a);
    qhat = a./denom;
    [~,n_optim] = max(qhat);
end