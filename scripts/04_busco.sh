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

# -------------------- Descriptions --------------------

# --rm : Automatically removes the container after execution.  
# -u $(id -u):$(id -g) : Runs the container with the current user’s ID and group.  
# -v : Mounts a directory from the host machine to the container.  
# -w : Sets the working directory inside the container.  
# -i : Specifies the input assembly file.  
# -l : Sets the lineage dataset for BUSCO analysis.  
# -o : Defines the output directory name.  
# --mode genome : Runs BUSCO in genome mode.  
# --cpu 8 : Uses 8 CPU cores.  
# --force : Overwrites existing results if present.  
