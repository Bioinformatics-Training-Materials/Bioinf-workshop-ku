#!/bin/bash

# Define the base directory
base_dir="$HOME/Bioinf-workshop-ku"

# Define the BUSCO results directory
busco_results="${base_dir}/results/busco/busco_output"

# Define the full path to the generate_plot.py script
plot_script="${base_dir}/scripts/generate_plot.py"

# Ensure that the generate_plot.py script is executable
chmod +x "$plot_script"

# Adjust permissions to ensure the Docker container can write to the busco_results directory
chmod -R ugo+rw "$busco_results"

# Run the generate_plot.py script using Docker
docker run --rm \
    --user $(id -u):$(id -g) \
    -v "${busco_results}:/busco_results" \
    -v "${plot_script}:/generate_plot.py" \
    -w /busco_results \
    fredrickkebaso/bioinformatics-env \
    bash -c "python3 /generate_plot.py --working_directory /busco_results"

# Wait for user input before closing the terminal
read -p "Press [Enter] key to exit..."
