# Algorithmic Process Overview

This repository contains a series of R scripts designed to execute a multi-phase algorithmic process to classify a validation dataset based on centroid positions determined through a series of convergences and an EM K-means cycle. Below is a detailed explanation of each script's role in the process.

## Scripts Description

### Phase 1 to 3: Convergence Series Execution

- **Script Name:** `alt_CpG_f1.R`
- **Description:** This script executes phases 1 through 3 of the algorithmic process. It systematically runs all 10 convergences in series, setting the foundation for the centroid determination in phase 4. Each convergence iterates through a predefined set of operations to progressively refine the dataset's classification parameters.

### Phase 4: Centroid Position Determination

- **Script Name:** `alt_fixed_position.R`
- **Description:** In phase 4, this script takes over to finalize the centroid positions. These centroids are crucial as they are used to predict the classification of the validation dataset. The script employs a fixed position approach to ensure the centroids are accurately determined and consistent for predictive purposes.

### Hyperparameter Optimization and Dimensionality Reduction

- **Script Name:** `alt_opt_CpG_f1.R`
- **Description:** This script is designed to optimize the sum of all CpG hyperparameters through an EM (Expectation-Maximization) K-means cycle. The goal is to achieve a significantly reduced set of dimensions. However, it's important to note that this method yielded different predictive outcomes due to overfitting issues. This script provides valuable insights into the challenges of dimensionality reduction and hyperparameter optimization within the context of our algorithmic process.

## Important Notes

- The `alt_opt_CpG_f1.R` script's approach to dimensionality reduction through hyperparameter optimization in an EM K-means cycle resulted in overfitting, rendering it ineffective for predictive purposes. This outcome highlights the delicate balance required in algorithmic tuning and the potential pitfalls of over-optimization.

## How to Run the Scripts

1. Ensure you have R installed on your system.
2. Clone this repository to your local machine.
3. Open each script in RStudio or your preferred R environment.
4. Execute the scripts in the following order to replicate the algorithmic process:
   - Run `alt_CpG_f1.R` for phases 1 through 3.
   - Proceed with `alt_fixed_position.R` for phase 4.
   - (Optional) Run `alt_opt_CpG_f1.R` to observe the attempted dimensionality reduction and its effects.

## MISSING FILES from RNA_seq data

trainingData.csv --- 1.6GB  --- 6 June 2023
The file trainingData.csv is a comprehensive database for the methylation values (m-values) associated with all the CpG probes collected from samples from patients used for the training phase.

mval_all.csv --- 2.0 GB  --- 28 Oct 2022
This file is a comprehensive database for the methylation values (m-values) associated with all the CpG probes collected from all patients.

mval_all2.csv --- 2.0 GB  --- 28 Oct 2022
Initially, I was going to combine multi-omic data; as such, this file contains a comprehensive database for the methylation values (m-values) associated with all the CpG probes collected from patients that had publicly available methylation data (450k Illumina), miRNA data, RNAseq data from KIRP TCGA project.
