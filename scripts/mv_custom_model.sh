#!/bin/bash
#SBATCH --job-name='mv_custom_model'         # Name of your job
#SBATCH --output='output_dir/z_mv_custom_model.out'          # Output file name
#SBATCH --time=00:01:00                # Set time
#SBATCH --chdir='.'                    # Working directory
#SBATCH --mem=10G                       # Adjust memory if needed

cp custom_Rscripts/Model_3_mod2.R original_Rscripts/
