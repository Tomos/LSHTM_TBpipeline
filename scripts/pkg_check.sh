#!/bin/bash
#SBATCH --job-name='R_package_check'	            # Name of your job
#SBATCH --output='output_dir/z_R_package_check.out'          # Output file name
#SBATCH --time=00:10:00               		    # Set time
#SBATCH --chdir='.'                   		    # Working directory
#SBATCH --mem=1G                    		    # Adjust memory if needed

module load anaconda3
module load R

conda activate $1
Rscript scripts/Package_check.R
