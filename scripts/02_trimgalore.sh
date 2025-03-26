#!/bin/bash

# Define the working directory
base_dir="$HOME/Bioinf-workshop-ku"
trim_results="${base_dir}/results/trimgalore"
fastqc_recheck="${base_dir}/results/fastqc-recheck"

# Ensure the results directories exist
mkdir -p "${trim_results}" "${fastqc_recheck}"

# Run Trim Galore with FastQC, specifying the FastQC output directory
docker run --rm -u $(id -u):$(id -g) \
    -v "${base_dir}/data":/data \
    -v "${trim_results}":/trim_results \
    -v "${fastqc_recheck}":/fastqc_recheck \
    fredrickkebaso/bioinformatics-env \
    bash -c "trim_galore --paired --cores 4 --length 25 --fastqc --fastqc_args \"--outdir /fastqc_recheck\" -o /trim_results /data/*.fastq.gz"

# -------------------- Descriptions --------------------

# -p : Creates parent directories if they don’t exist.  
# --rm : Automatically removes the container after execution.  
# -u $(id -u):$(id -g) : Runs the container with the current user’s ID and group.  
# -v : Mounts a directory from the host machine to the container.  
# --paired : Processes paired-end reads.  
# --cores 4 : Uses 4 CPU cores for trimming.  
# --length 25 : Discards reads shorter than 25 bases.  
# --fastqc : Runs FastQC after trimming.  
# --fastqc_args : Passes additional arguments to FastQC.  
# --outdir : Specifies the output directory for trimmed files.  
