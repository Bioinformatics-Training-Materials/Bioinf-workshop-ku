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
    bash -c "spades.py --pe1-1 /trim_results/*_val_1.fq.gz --pe1-2 /trim_results/*_val_2.fq.gz -k 51 --threads 2 --memory 4 -o /spades_results"

# -------------------- Descriptions --------------------

# -p : Creates parent directories if they don’t exist.  
# --rm : Automatically removes the container after execution.  
# -u $(id -u):$(id -g) : Runs the container with the current user’s ID and group.  
# -v : Mounts a directory from the host machine to the container.  
# --pe1-1 : Specifies the first pair-end read files.  
# --pe1-2 : Specifies the second pair-end read files.  
# -k 51 : Sets the k-mer size to 51.  
# --threads 2 : Uses 2 CPU threads.  
# --memory 4 : Allocates 4 GB of RAM.  
# -o : Specifies the output directory.  
