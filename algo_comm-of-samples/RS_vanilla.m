function n_optim = RS_vanilla(x,sigma,N)
    n_optim = 0;
    n = 0;
    mu = x;
    
    while 1
        u = rand;
        z = laprnd(mu,sigma);
        fz = q(x,z,sigma);
        gz = lap_pdf(z,x,sigma);
        wmin = compute_wmin(x,sigma);
        if (u <= wmin*fz/gz || n >= N)
            n_optim = n;
            break
        end
        n = n+1;
    end
end


function [q_z, M] = q(x,z,sigma)
    theta = 10e-4; mu1=0;s1=1;
    a = lap_invcdf(theta/2,mu1,s1);
    b = lap_invcdf(1-theta/2,mu1,s1);
   
    % Candidate Distribution
    mu2=0; s2 = sqrt(sigma^2 + 1);
    a_phi = lap_cdf(a,mu2,s2);
    b_phi = lap_cdf(b,mu2,s2);
    M = floor(1/(b_phi - a_phi));
    
    % Generate a random sample from Canadidate Distribution
    mu3=0; s3=sqrt(sigma^2+1);
    z_hat = lap_invcdf(z,mu3,s3);
    z_pdf = lap_pdf(z_hat,mu3,s3);
    % Transformed Target Distribution
    mu4=x; s4 = 1;
    qhat_pdf = lap_pdf(z_hat,mu4,s4);
    
    % Compute pdf of z in target distribution
    q_z = (1/M)*(qhat_pdf/z_pdf);
    
end

function wmin = compute_wmin(x,sigma)
    theta = 10e-4;
    zmin = (sigma^2 + 1)/(sigma^2) * x;
    
    pd = lap_pdf(zmin,0,sqrt(sigma^2+1));
    qd = lap_pdf(zmin,x,1);
    
    wmin = (1-theta)*pd/qd;
end