# Analysis 4: Relatedness Density and Diversification Potential
# Replicates the methodology from P.A. Balland's EconGeo Tutorial 4

library(EconGeo)
library(dplyr)
library(ggplot2)

# 1. Load results
rca_data <- readRDS("rca_results.rds")
mcp <- rca_data$mcp
rel <- readRDS("relatedness_results.rds")

# 2. Calculate Relatedness Density
# Relatedness density measures how close a region's current capabilities are 
# to a specific field. It is a predictor of future specialization.
dens <- relatedness.density(mcp, rel)

# 3. Analyze Diversification Opportunities for a specific country (e.g., Chile 'CL')
# We look for fields where RCA < 1 but Relatedness Density is high.
country_code <- "CL"
if (country_code %in% rownames(dens)) {
  country_dens <- dens[country_code, ]
  country_mcp <- mcp[country_code, ]
  
  opportunities <- data.frame(
    Field = names(country_dens),
    Density = country_dens,
    Current_RCA = country_mcp
  ) %>%
    filter(Current_RCA == 0) %>% # Only look at fields not yet specialized
    arrange(desc(Density))
  
  cat(paste("Top 10 Diversification Opportunities for", country_code, ":\n"))
  print(head(opportunities, 10))
  
  # 4. Visualization: Density vs complexity (PCI)
  complexity <- readRDS("complexity_results.rds")
  pci <- complexity$pci
  
  # Align PCI with opportunities
  plot_data <- opportunities %>%
    inner_join(data.frame(Field = names(pci), PCI = pci), by = "Field")
  
  ggplot(plot_data, aes(x = Density, y = PCI)) +
    geom_point(alpha = 0.5, color = "steelblue") +
    geom_smooth(method = "lm", color = "red", linetype = "dashed") +
    theme_minimal() +
    labs(title = paste("Strategic Positioning for", country_code),
         subtitle = "Relatedness Density vs Field Complexity (PCI)",
         x = "Relatedness Density (Opportunity)",
         y = "Knowledge Complexity (PCI)")
} else {
  cat(paste("Country code", country_code, "not found in data."))
}
