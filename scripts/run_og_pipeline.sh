#!/bin/bash
#SBATCH --job-name='run_og_pipeline'         # Name of your job
#SBATCH --output='output_dir/z_run_og_pipeline.out'          # Output file name
#SBATCH --time=00:30:00                # Set time
#SBATCH --chdir='.'                    # Working directory
#SBATCH --mem=10G                       # Adjust memory if needed

module load anaconda3
module load R
conda activate $1
Rscript custom_Rscripts/Model_comparison_TPJ.R $2 $3 $4 $5 $6 $7 $8
