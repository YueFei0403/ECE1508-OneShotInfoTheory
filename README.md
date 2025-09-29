# ECE1508 Project Reports

Two reports exploring **rate-constrained inference** and **efficient sample communication** in distributed learning systems.

---

## 📁 Contents
| File | Title | Focus |
|------|-------|-------|
| `ECE1508_Project_Report.pdf` | Minimax Approach for Distributed Inference | Minimax risk-rate learning with Poisson Functional Representation Lemma (PFRL) and rate-constrained linear regression |
| `report-perf-algo-comm-of-samples.pdf` | Sampling & Coding (Q6) | Computational cost and performance of Poisson-based and hybrid coding for sample communication |

---

## 🔑 Report Summaries

### 1. Minimax Approach for Distributed Inference
- Extends **minimax supervised learning** to **distributed inference with communication constraints**.  
- Introduces **risk-rate Lagrangian** balancing estimator accuracy and descriptor rate.  
- Applies **PFRL** for tighter (3.732-bit) upper bound on communication cost.  
- Demonstrates **risk vs. rate trade-offs** in linear regression using MATLAB simulations.

### 2. Sampling & Coding
- Compares **Poisson Functional Coding (PFC)**, **Hybrid coding**, **Minimal Random Coding (MRC)**, and **ORC**.  
- Analyzes **median candidate counts (n\*)**, percentile ranges, and **coding cost vs. candidate size**.  
- Shows **Hybrid coding outperforms PFC for large σ** and converges faster with more candidates.

---

## ⚙️ Requirements
- MATLAB **R2020a+**
- Built-in functions: `normrnd`, `lap_pdf`, `lap_cdf`, `gamma`
- No additional toolboxes required

---

## 🚀 How to Reproduce
1. Open MATLAB and copy the scripts provided in the **Appendix** of each report.
2. Adjust parameters (`Rate`, `lambda`, `rho`, `sigma`) as needed.
3. Run the `channel_sim.m` and `pfl_channel_sim.m` to reproduce:
   - **Risk-Rate curves** (ECE1508_Project_Report 1, Fig. 3)
   - **Coding-Cost curves** (ECE1508_Project_Report 2, Figs. 1–3)

---

## 📚 References
- Farnia & Tse, *A Minimax Approach to Supervised Learning*, 2017  
- Li et al., *Minimax Learning for Distributed Inference*, IEEE T-IT, 2020  
- Li & Anantharam, *Poisson Matching Lemma*, IEEE T-IT, 2021  
- Theis & Ahmed, *Algorithms for the Communication of Samples*, ICML 2022  
(Full reference lists in each PDF.)

---

## 👤 Author
**Yue Fei** – ECE1508 Student Project Reports

---

> These materials are for academic and research use only.