# CfCV
Confirmatory Cross Validation - Towards algorithmic debiasing in machine learning experiment
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Status: Research Implementation](https://img.shields.io/badge/Status-Active-blue)](https://github.com/ojakintande/LLM_Who_Audit_Reviewers)

This repository provides the implementation of **CfCV (Confirmatory Cross-Validation)**, a novel data-splitting framework that integrates the principles of **Inclusion, Participation, and Reciprocity (IPR)** to mitigate algorithmic bias during model training and validation.

---

## 1. Research Overview
Algorithmic unfairness often stems from data-inconsistent, diversity, and inclusion biases, leading to poor representation in training and validation sets. While traditional Cross-Validation (CV) addresses training-to-validation consistency, it often fails to account for population representativeness regarding sensitive attributes.

Our study introduces **CfCV**, an innovative approach that:
*   Links IPR principles to data splitting for sensitive attributes.
*   Remodifies the Pre-In-Post (P-I-P) processing approach to accommodate various sensitive attribute levels.
*   Ensures population grouping representativeness during the splitting process.

## 2. Performance Analysis
CfCV consistently outperforms existing standard techniques, including $V-fold$ and $HoldOut$ cross-validation, in both experimental simulations and real-life applications.

| Metric | CfCV | V-fold | HoldOut |
| :--- | :--- | :--- | :--- |
| **Exp. RMSE** | **0.88** | 0.98 | 4.69 |
| **Exp. Accuracy** | **99.75%** | 99.50% | 85.50% |
| **App. RMSE** | **0.59** | 1.61 | 1.96 |
| **App. Accuracy** | **84%** | 81% | 52% |

## 3. Repository Structure
*   `/scripts`: Implementation of the CfCV algorithm and P-I-P processing module.
*   `/data`: Datasets utilized for simulation and real-life application testing.
*   `/results`: Performance metrics comparing CfCV against $V-fold$ and $HoldOut$.

## 4. Quick Start
To integrate CfCV into your fairness-aware machine learning pipeline:

1.  **Environment:** Ensure R (v4.x) is installed.
2.  **Implementation:** Load the CfCV splitting module:
```r
    source("scripts/cfcv_splitter.R")
    # Apply IPR-based data splitting
    split_data <- cfcv_split(dataset, sensitive_attribute = "group_id")
```
#
## 5. Conclusion & Recommendation
This study demonstrates that machine learning experiments achieve higher fairness when the concept of IPR forms the foundation of the human-machine intelligence framework[cite: 1]. We recommend adopting IPR-based data splitting for all human-machine intelligence systems to ensure equitable model performance.

## 6. Citation
If you use this framework in your research, please cite:
@article{AKINTANDE2024200350,
title = {CfCV: Towards algorithmic debiasing in machine learning experiment},
journal = {Intelligent Systems with Applications},
volume = {22},
pages = {200350},
year = {2024},
issn = {2667-3053},
doi = {https://doi.org/10.1016/j.iswa.2024.200350}

## 7. License
This project is licensed under the **MIT License**[cite: 1].
