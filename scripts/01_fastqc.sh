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

# -------------------- Descriptions --------------------

# -p : Creates parent directories if they don’t exist.  
# --rm : Automatically removes the container after execution.  
# -u $(id -u):$(id -g) : Runs the container with the current user’s ID and group.  
# -v : Mounts a directory from the host machine to the container.  
# --threads 4 : Uses 4 CPU threads for processing.  
# --outdir : Specifies the directory where output files will be saved.  
