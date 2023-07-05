# This code is used to produce the results in "Sumner and White, Modelling the impact of tuberculosis preventive therapy: the importance of model structure"
# It compares the use of different structures for the progression from latency to disease and the impact on the predicted effect of a simple preventive therapy intervention

args <- commandArgs(trailingOnly = TRUE)
dir <- args[1]
mod1_cum <- args[2]
mod2_cum <- args[3]
mod3_cum <- args[4]
mod1 <- args[5]
mod2 <- args[6]
mod3 <- args[7]


# Set the working directory
setwd(dir)

# load libraries
require(deSolve)
require(ggplot2)
require(reshape2)
require(stats)
library(FME)

# load the different models

# these calculate the cumulative TB incidence (ignoring death and re-infection)
source(mod1_cum)
source(mod2_cum)
source(mod3_cum)

# these are the transmission models
source(mod1)
source(mod2)
source(mod3)

# Set up accessible palette for plotting
cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

##############################################################################################################################################
# This script implements the analysis of the cumulaitve TB risk reported in the appendix
# 
# produces Figure_A1

source("Cumulative_incidence_analysis.R")
saveRDS(Figure_A1, "Figure_A1.rds")
##############################################################################################################################################
# This script implements the analysis of the steady state incidence and intervention affects reported in the main text
# 
# produces Figure_2, Figure_3, Figure_A2

source("Intervention_analysis.R")
saveRDS(Figure_A2, "Figure_A2.rds")
saveRDS(Figure_2, "Figure_2.rds")
saveRDS(Figure_3, "Figure_3.rds")

##############################################################################################################################################
# This script implements the analysis of the duration of the fast latent state for model 1 reported in the appendix
# 
# produces Figure_A3

source("Duration_analysis.R")
saveRDS(Figure_A3, "Figure_A3.rds")
##############################################################################################################################################
# This script repeats the intervention analysis with the reparameterised version of model 3
# 
# produces Figure_A4

source("Model_3_reparameterise.R")
saveRDS(Figure_A4, "Figure_A4.rds")


