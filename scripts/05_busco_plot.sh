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

# -------------------- Descriptions --------------------

# --rm : Automatically removes the container after execution.  
# --user $(id -u):$(id -g) : Runs the container with the current user’s ID and group.  
# -v : Mounts a directory or file from the host machine to the container.  
# -w : Sets the working directory inside the container.  
# chmod +x : Makes a script executable.  
# chmod -R ugo+rw : Grants read and write permissions to all users recursively.  
# read -p : Prompts the user for input before exiting.  
