require(deSolve)
require(ggplot2)
require(reshape2)
require(stats)
library(FME)

base_dir <- "C:/Users/tomos/OneDrive/TB_pipeline/output_figures/"

### Figure 2A:

Figure2A <- readRDS(paste0(base_dir, "Figure_2A.rds"))
plot(Figure2A)
ggsave(paste0(base_dir, "Figure2A.png"), Figure2A, width = 8, height = 5)

Figure2A_mod <- readRDS(paste0(base_dir, "Figure_2A_mod.rds"))
plot(Figure2A_mod)
ggsave(paste0(base_dir, "Figure2A_mod.png"), Figure2A_mod, width = 8, height = 5)

### Figure 2:

Figure2 <- readRDS(paste0(base_dir, "Figure_2.rds"))
plot(Figure2)
ggsave(paste0(base_dir, "Figure2.png"), Figure2, width = 8, height = 5)

Figure2_mod <- readRDS(paste0(base_dir, "Figure_2_mod.rds"))
plot(Figure2_mod)
ggsave(paste0(base_dir, "Figure2_mod.png"), Figure2_mod, width = 8, height = 5)

### Figure 3:

Figure3 <- readRDS(paste0(base_dir, "Figure_3.rds"))
plot(Figure3)
ggsave(paste0(base_dir, "Figure3.png"), Figure3, width = 8, height = 5)

Figure3_mod <- readRDS(paste0(base_dir, "Figure_3_mod.rds"))
plot(Figure3_mod)
ggsave(paste0(base_dir, "Figure3_mod.png"), Figure3_mod, width = 8, height = 5)
