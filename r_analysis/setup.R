# Setup script for EconGeo Analysis
# This script installs the necessary libraries to run the economic complexity analysis in R.

# 1. Install devtools if not present (to install from GitHub if needed)
if (!require("devtools")) install.packages("devtools")

# 2. Install EconGeo from GitHub (most stable version)
if (!require("EconGeo")) devtools::install_github("PABalland/EconGeo")

# 3. Install other dependencies for data handling and visualization
required_packages <- c("arrow", "dplyr", "tidyr", "Matrix", "reshape2", "ggplot2", "pheatmap")

new_packages <- required_packages[!(required_packages %in% installed.packages()[,"Package"])]
if(length(new_packages)) install.packages(new_packages)

cat("✅ Setup complete. You can now run the analysis scripts.\n")
