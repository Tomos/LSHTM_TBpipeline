require(deSolve)
require(ggplot2)
require(reshape2)
require(stats)
library(FME)

base_dir <- "C:/Users/tomos/OneDrive/TB_pipeline/output_figures/"

### Figure 2A:

Figure2A <- readRDS(paste0(base_dir, "Figure_2A.rds"))
plot(Figure2A)

Figure2A_mod <- readRDS(paste0(base_dir, "Figure_2A_mod.rds"))
plot(Figure2A_mod)

### Figure 2:

Figure2 <- readRDS(paste0(base_dir, "Figure_2.rds"))
plot(Figure2)

Figure2_mod <- readRDS(paste0(base_dir, "Figure_2_mod.rds"))
plot(Figure2_mod)

### Figure 3:

Figure3 <- readRDS(paste0(base_dir, "Figure_3.rds"))
plot(Figure3)

Figure3_mod <- readRDS(paste0(base_dir, "Figure_3_mod.rds"))
plot(Figure3_mod)
