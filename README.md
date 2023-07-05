**<ins> <span style="font-size: 22px;">Task description:</span> </ins>**

This paper predicts impact of Tuberculosis preventive therapy: 
https://bmcinfectdis.biomedcentral.com/articles/10.1186/s12879-020-05592-5

Your task is to:
- Create a pipeline to reproduce the style and trends in Figure 3 from the publication
- Which meets appropriate software engineering standards
- Apply this pipeline for model 3 (from the publication), and the modification to model 3 (described in bullet C below)
- Explain how the pipeline could be used to include other models
- Feel free to work from the resources provided in that paper, or not, as you see fit

Modification model: Add a T (on treatment) compartment to model 3 with an inflow from I into T (assume a constant rate) and an outflow from T to S (constant rate). Make reasonable assumptions for the parameters of the inflow into T and outflow out of T.

Provide your work as a self-contained, self-explanatory entity (e.g. as a code repository, or a zip file), that a reasonably skilled scientist would be able to run and add another model to. 

---

**<ins> <span style="font-size: 22px;">Solution outline:</span> </ins>**

This pipeline was developped on the HPC cluster an Northern Arizona University (Monsoon), and requires a Linux platform with a SLURM scheduler, Anaconda3, and R.

The pipeline initiated by running the GO.sh script from the command line with:

	> bash GO.sh

This script performs the following tasks:
- Uses the check_mod() function in the module_check.sh script (in the scripts directory) to check that anaconda3 and R are available
- Creates an output directory ('*output_dir*') where the output files from the SBATCH jobs will be stored (useful for debugging).
- If Anaconda3 and R are available, the pipeline progresses to create a conda environment with the name Teberculosis_pipeline_R_packages_'*username*'
	* The pipeline will only create the environment if it does not already exist
	* This part of the code can be modified easily to prompt the user to enter the name of the conda env (commented out at present)
- Sbatch job 1: checks the conda environment for the R packages: deSolve, ggplot2, reshape2, stats and FME using the pkg_check.sh and Package_check.R
- Sbatch job 2 (with dependancy on job 1): clones the GitHub repostiroy from: https://github.com/tomsumner/Latency_Model_Comparison_Public/
- Sbatch job 4 (with dependancy on job 2): moves modified model 3 into the original_Rscripts directory
- sbatch job 5 (with dependancy on job 4): runs Intervention Analysis with regular models
- sbatch job 6 (with dependancy on job 5): runs Intervention Analysis with modified model 3.

To apply the pipeline to different models (assumption: provided in the original_Rscripts directory), the model variables in the GO.sh script would need to be changed to the name of the new model(s).




