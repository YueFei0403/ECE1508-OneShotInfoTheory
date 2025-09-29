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


