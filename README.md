# Bioinformatics-workshop-kenyatta-universiy

## Overview

This repository contains a step-by-step workflow for processing sequencing data using bioinformatics tools. The scripts automate quality control, trimming, genome assembly, and analysis with BUSCO, along with generating summary plots.

## Prerequisites

You only need a google account to sign in to: [Google Cloud Platform Console](https://www.googleadservices.com/pagead/aclk?sa=L&ai=DChcSEwig0KDaj6iMAxU6h_0FHcRHI1UYABAAGgJ3Zg&co=1&ase=2&gclid=Cj0KCQjwy46_BhDOARIsAIvmcwN5yBK-SbjvrxU-MBLq9zMedv0UenRcmN3vTpHpp9--plrk35MkWN4aAsohEALw_wcB&ohost=www.google.com&cid=CAESVuD2KDLSAyVk-woZ-qm-pFpfonSLFmkDX_cl2kt-mKuBOS2pUPbb6f8k8RuvCZ0IyGwI5aoz7DDVkJV_0ZalzoB_iMMOMmKtqsT3Sm1KkDfhH06Yy6ca&sig=AOD64_3ujj9kHNtgRslEJcuGf7gjfHHXsw&q&nis=4&adurl&ved=2ahUKEwjG25raj6iMAxWSSvEDHcduMpEQ0Qx6BAgKEAE) 

## Usage Instructions

### Activate your cloud shell as shown below:

![Screenshot 2025-03-26 192540](https://github.com/user-attachments/assets/935866d9-e945-48f5-962b-b69b78645a6a)


Follow these steps sequentially to process your sequencing data:

### Accessing the console on Google cloud


Click on the console tab on the right corner of your Google cloud window.


### Download Data and scripts

Clone the GitHub repo as below to obtain required data and scripts for this session:

```bash
git clone https://github.com/Bioinformatics-Training-Materials/Bioinf-workshop-ku.git
```

Navigate to the working directory using the below command

```bash
cd Bioinf-workshop-ku
```
### 1. Run FastQC for quality control

```bash
bash scripts/01_fastqc.sh
```
- Performs quality control on raw sequencing reads using FastQC.
- Stores results in the `results/fastqc/` directory.

### 2. Trim sequences using Trim Galore
```bash
bash scripts/02_trimgalore.sh
```
- Trims low-quality reads and adapters.
- Performs a second round of FastQC.
- Outputs trimmed reads to `results/trimgalore/`.

### 3. Assemble the genome using SPAdes
```bash
bash scripts/03_spades.sh
```
- Assembles reads into contigs.
- Stores results in `results/spades/`.

### 4. Assess assembly completeness with BUSCO
```bash
bash scripts/04_busco.sh
```
- Runs BUSCO to assess genome completeness.
- Saves output in `results/busco/`.

### 5. Generate BUSCO summary plot
```bash
bash scripts/05_busco_plot.sh
```
- Runs a Python script inside Docker to visualize BUSCO results. Access the plot in  `results/busco/`. 

### 6. Typical plot from previous run
```bash
bash scripts/06_busco_plot_2.sh
```
- Results in `./data`.

## Author

Fredrick Kebaso
