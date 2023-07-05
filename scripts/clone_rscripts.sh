#!/bin/bash
#SBATCH --job-name='clone_Rscript'         # Name of your job
#SBATCH --output='output_dir/z_clone_Rscript.out'          # Output file name
#SBATCH --time=00:10:00                # Set time
#SBATCH --chdir='.'                    # Working directory
#SBATCH --mem=1G                       # Adjust memory if needed

git clone $1 $2
