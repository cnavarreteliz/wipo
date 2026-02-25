# Analysis 2: Relatedness (Proximity)
# Replicates the methodology from P.A. Balland's EconGeo Tutorial 2

library(EconGeo)
library(pheatmap)

# 1. Load RCA results from previous step
results <- readRDS("rca_results.rds")
mcp <- results$mcp

# 2. Calculate Relatedness (Proximity) Matrix
# relatedness() calculates the proximity between industries.
# The 'method' argument can be 'prob' (Hidalgo et al 2007) or others.
# Here we use the standard co-occurrence based proximity.
rel_matrix <- relatedness(mcp, method = "probit")

# 3. Visualize a subset (first 20 fields)
# This mimics the proximity heatmap from the Python analysis
subset_rel <- rel_matrix[1:20, 1:20]
pheatmap(subset_rel, 
         main = "Innovation Proximity Matrix (Subset)",
         display_numbers = TRUE,
         color = colorRampPalette(c("white", "steelblue"))(100))

# 4. Output summary
cat("Relatedness Calculation Complete\n")
cat("Mean proximity between fields:", mean(rel_matrix[upper.tri(rel_matrix)]), "\n")

# Save results for next steps
saveRDS(rel_matrix, "relatedness_results.rds")
