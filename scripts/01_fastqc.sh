#!/bin/bash

# Define the working directory
base_dir="$HOME/Bioinf-workshop-ku"
fastqc_results="${base_dir}/results/fastqc"

# Ensure the results directory exists
mkdir -p "${fastqc_results}"

# Run FastQC using Docker
docker run --rm -u $(id -u):$(id -g) \
    -v "${base_dir}/data":/data \
    -v "${fastqc_results}":/fastqc_results \
    fredrickkebaso/bioinformatics-env \
    bash -c "fastqc --threads 4 --outdir /fastqc_results /data/*.fastq.gz"
