#!/bin/bash

# Define the working directories
base_dir="$HOME/Bioinf-workshop-ku"
assembly_results="${base_dir}/results/assembly"
busco_results="${base_dir}/results/busco"

# Ensure the results directory exists
mkdir -p "${busco_results}"

# Run BUSCO analysis using the Diptera lineage
docker run --rm -u $(id -u):$(id -g) \
    -v "${assembly_results}":/assembly_results \
    -v "${busco_results}":/busco_results \
    fredrickkebaso/bioinformatics-env \
    bash -c "busco -i /assembly_results/contigs.fasta -l diptera_odb10 -o /busco_results --mode genome --cpu 8"
