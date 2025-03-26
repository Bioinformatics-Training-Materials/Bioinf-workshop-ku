#!/bin/bash

# Define the working directory
base_dir="$HOME/Bioinf-workshop-ku"
trim_results="${base_dir}/results/trimgalore"
spades_results="${base_dir}/results/spades"

# Ensure the results directories exist
mkdir -p "${trim_results}" "${spades_results}"

# Run SPAdes assembly with specified k-mer sizes
docker run --rm -u $(id -u):$(id -g) \
    -v "${trim_results}":/trim_results \
    -v "${spades_results}":/spades_results \
    fredrickkebaso/bioinformatics-env \
    bash -c "spades.py --pe1-1 /trim_results/*_val_1.fq.gz --pe1-2 /trim_results/*_val_2.fq.gz -k 51 --threads 8 --memory 2 -o /spades_results"
