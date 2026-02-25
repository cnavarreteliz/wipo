# Analysis 3: Economic and Knowledge Complexity
# Replicates the methodology from P.A. Balland's EconGeo Tutorial 3

library(EconGeo)

# 1. Load RCA results from first step
results <- readRDS("rca_results.rds")
mcp <- results$mcp

# 2. Calculate Knowledge Complexity Index (KCI)
# KCI() is the EconGeo implementation of the Method of Reflections (ECI/PCI)
# It returns a list with country metrics (ECI) and industry metrics (PCI)
kci_results <- KCI(mcp, index = "KCI")

eci <- kci_results$KCI_regional
pci <- kci_results$KCI_industrial

# 3. Sort countries by ECI
top_countries <- sort(eci, decreasing = TRUE)
cat("Top 10 Countries by Economic Complexity Index (ECI):\n")
print(head(top_countries, 10))

# 4. Sort industries by Complexity (PCI)
top_fields <- sort(pci, decreasing = TRUE)
cat("\nTop 10 Fields by Knowledge Complexity Index (PCI):\n")
print(head(top_fields, 10))

# Save results
saveRDS(list(eci = eci, pci = pci), "complexity_results.rds")
