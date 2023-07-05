#!/bin/bash



# CHECK THAT THE ANACONDA3 AND R PACKAGES ARE AVAILABLE ON SYSTEM:
source ./scripts/module_check.sh

anaconda3_check=$(check_mod anaconda3)
ac_value=$?
echo $anaconda3_check
#echo $ac_value
R_check=$(check_mod R)
rc_value=$?
echo $R_check
#echo $rc_value

# SOME UNIT TESTS TO SHOW THAT THE check_mod FUNCTION BEHAVES AS EXPECTED:
#source ./scripts/module_check_test.sh
#check_mod_test


# LOAD ANACONDA AND R MODULES:
module load anaconda3


module load R

# CREATE OUTPUT_DIR, WHERE SBATCH OUTPUT FILES WILL LIVE:
rm -r output_dir
mkdir output_dir



# VARIABLES:
ME=$(whoami)
DEST=$(echo './original_Rscripts')
#ENV_NAME=$(echo 'Teberculosis_pipeline_R_packages_'$ME)
GITHUB_NAME=$(echo 'https://github.com/tomsumner/Latency_Model_Comparison_Public/')
read -p  "Enter conda environment name: " ENV_NAME
#echo $ENV_NAME
APP1=$(echo "regular")
APP2=$(echo "modified")

# CREATE DIRECTORY FOR FILES FROM GITHUB:
rm -rf "$DEST/.git"
rm -r $DEST
mkdir $DEST


# MODELS:
MOD1_CUM=$(echo "Model_1_cum.R")
MOD2_CUM=$(echo "Model_2_cum.R")
MOD3_CUM=$(echo "Model_3_cum.R")
#echo $MOD1_CUM
MOD1=$(echo "Model_1.R")
MOD2=$(echo "Model_2.R")
MOD3=$(echo "Model_3.R")
#echo $MOD1
MOD3_MOD=$(echo "Model_3_mod2.R")

# IF BOTH PACKAGES INSTALLED AND CONDA ENV DOES NOT ALREADY EXITS, THE PIPELINE WILL CONTINUE:
if [ "$ac_value" == 0 ] && [ "$rc_value" == 0 ]; then

    if ! conda env list | grep -q "\<$ENV_NAME\>"; then
        echo "Conda environment: $ENV_NAME does not exists; creating environment."
	conda create -y -n $ENV_NAME
    elif conda env list | grep -q "\<$ENV_NAME\>"; then
	echo "Conda environent: $ENV_NAME detected; activating environment."

	# R script that loads necessary R packages
	echo "Checking $ENV_NAME for the R packages: deSolve, ggplot2, reshape2, stats, and FME."
	echo "Are R packages installed? if installed, they are loaded. If not, the packages will be installed."
	job_id1=$(sbatch scripts/pkg_check.sh $ENV_NAME| awk '{ print $4 }')

	job_id2=$(sbatch --dependency=afterok:${job_id1} scripts/clone_rscripts.sh $GITHUB_NAME $DEST| awk '{ print $4 }')

#	job_id3=$(sbatch --dependency=afterok:${job_id2} scripts/run_og_pipeline.sh $ENV_NAME $DEST $MOD1_CUM $MOD2_CUM $MOD3_CUM $MOD1 $MOD2 $MOD3| awk '{ print $4 }')

	job_id4=$(sbatch --dependency=afterok:${job_id2} scripts/mv_custom_model.sh| awk '{ print $4 }')

	job_id5=$(sbatch --dependency=afterok:${job_id4} scripts/run_regular_intervention.sh $ENV_NAME $DEST $MOD1_CUM $MOD2_CUM $MOD3_CUM $MOD1 $MOD2 $MOD3| awk '{ print $4 }')

	job_id6=$(sbatch --dependency=afterok:${job_id5} scripts/run_custom_intervention.sh $ENV_NAME $DEST $MOD1_CUM $MOD2_CUM $MOD3_CUM $MOD1 $MOD2 $MOD3_MOD | awk '{ print $4 }')


   else
	echo "Env error 1"
    fi
fi


















