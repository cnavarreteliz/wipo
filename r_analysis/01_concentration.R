# Analysis 1: Geographic Concentration and RCA
# Replicates the methodology from P.A. Balland's EconGeo Tutorial 1

library(EconGeo)
library(arrow)
library(dplyr)
library(tidyr)
library(Matrix)

# 1. Load Data
# We use the Production (P) dimension for 2023
data <- read_parquet("../data/outputs.parquet")
data_2023 <- data %>% 
  filter(Period == 2023, Dimension == 'P') %>%
  select(Unit, `Field ID`, `Outputs (Fractional)`)

# 2. Create the Region-Industry Matrix
# EconGeo expects a matrix where rows are regions and columns are industries
mat <- data_2023 %>%
  pivot_wider(names_from = `Field ID`, values_from = `Outputs (Fractional)`, values_fill = 0) %>%
  as.data.frame()

rownames(mat) <- mat$Unit
mat <- as.matrix(mat[,-1])

# 3. Calculate RCA (Revealed Comparative Advantage)
# The RCA function in EconGeo computes the Balassa Index (Location Quotient)
# RCA_mat[i,j] > 1 indicates that region i has a comparative advantage in industry j
rca_matrix <- RCA(mat)

# 4. Create Binary Matrix (Mcp)
# Traditional complexity analysis uses a binary matrix where 1 means RCA > 1
mcp <- ifelse(rca_matrix > 1, 1, 0)

# 5. Output summary
cat("RCA Calculation Complete\n")
cat("Matrix dimensions (Countries x Fields):", dim(mcp)[1], "x", dim(mcp)[2], "\n")
cat("Average ubiquity of fields:", mean(colSums(mcp)), "\n")
cat("Average diversity of countries:", mean(rowSums(mcp)), "\n")

# Save results for next steps
saveRDS(list(mat = mat, rca = rca_matrix, mcp = mcp), "rca_results.rds")
