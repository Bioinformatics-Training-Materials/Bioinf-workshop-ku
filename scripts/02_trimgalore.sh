#!/bin/bash

# Define the working directory
base_dir="$HOME/Bioinf-workshop-ku"
results="${base_dir}/results/trimgalore"

# Ensure the results directory exists
mkdir -p "${results}"

# Run Trim Galore inside Docker as the current user
docker run --rm -u $(id -u):$(id -g) \
    -v "${base_dir}/data":/data \
    -v "${results}":/results \
    fredrickkebaso/bioinformatics-env \
    bash -c "mkdir -p /results && trim_galore --paired --cores 4 -o /results /data/*.fastq.gz"
