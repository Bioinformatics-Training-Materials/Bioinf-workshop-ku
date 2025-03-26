#!/bin/bash

# Define the working directories
base_dir="$HOME/Bioinf-workshop-ku"
spades_results="${base_dir}/results/spades"
busco_results="${base_dir}/results/busco"

# Ensure the results directory exists
mkdir -p "${busco_results}"

# Run BUSCO analysis using the Diptera lineage
docker run --rm -u $(id -u):$(id -g) \
    -v "${spades_results}":/spades_results \
    -v "${busco_results}":/busco_results \
    -w /busco_results \
    fredrickkebaso/bioinformatics-env \
    bash -c "busco -i /spades_results/contigs.fasta -l diptera_odb10 -o busco_output --mode genome --cpu 8 --force"
