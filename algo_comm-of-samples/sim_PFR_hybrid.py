import numpy as np
import scipy.stats as stats
import matplotlib.pyplot as plt
import seaborn as sns
import statistics
from statistics import NormalDist
import json


def Npdf(x,mean,std):
    pdf = (np.pi*std) * np.exp(-0.5*((x-mean)/std)**2)
    return pdf

def  PFR_coding(x,sigma):
    t = 0
    n = 1
    s_optim = float('inf')
    wmin = 0

    while (s_optim > t*wmin):
        z = np.random.uniform()
        t = t + np.exp(1)
        pz = Npdf(z,mean=x,std=sigma)
        qz, wmin, M = q(x,z,sigma)
        s = t*(pz/qz)

        if s < s_optim:
            s_optim = s
            n_optim = n
        
        n = n + 1

    return n_optim,M


def q(x,z,sigma):
    theta = 10e-4 

    # define truncating interval 
    normstd = NormalDist(mu=0,sigma=1)
    a = normstd.inv_cdf(theta/2)
    b = normstd.inv_cdf(1-theta/2)
   
    ## Candidate Distribution
    p_pdf = NormalDist(mu=x,sigma=np.sqrt(sigma^2+1))
    a_phi = p_pdf.cdf(a)
    b_phi = p_pdf.cdf(b)
    M = np.floor(1/(b_phi - a_phi))
    
    ## Transformed Target Distribution
    qhat_pdf = NormalDist(mu=x,sigma=1)
    
    ## Generate a random sample from Canadidate Distribution
    z_hat = p_pdf.inv_cdf(z)
    z_pdf = NormalDist(mu=0,sigma=np.sqrt(sigma^2+1))
    
    ## Compute pdf of z in target distribution
    fz = qhat_pdf.pdf(z_hat)
    gz = z_pdf.pdf(z_hat)
    
    q_z = (1/M)*(fz/gz)

    ## Compute wmin
    zmin = (sigma^2 + 1)/(sigma^2) * x
    
    z_num = z_pdf.pdf(zmin)
    q_denom = qhat_pdf.pdf(zmin)
    wmin = (1-theta)* z_num / q_denom
    
    return q_z, wmin, M


if __name__ == "__main__":
    std_dev = range(0,50,10)
    Ntrials = len(std_dev)
    Mtrials = 10
    n_star = np.zeros((Ntrials,1),dtype=int)

    for i in range(Ntrials):
        print(f"Current Iteration: {i}")
        n_val = np.zeros((Mtrials,1))
        M_val = np.zeros((Mtrials,1))
        for j in range(Mtrials):
            sigma = std_dev[i]
            x = np.random.normal(0,sigma,1)

            n_optim, M_avg = PFR_coding(x,sigma)
            n_val[j] = n_optim 
            M_val[j] = M_avg
        n_star[i] = np.median(n_val)

    
    with open('n_star.txt', 'w') as filehandle:
        json.dump(n_star.toList(), filehandle)
    with open('M_avg.txt', 'w') as filehandle:
        json.dump(M_avg.toList(), filehandle)

