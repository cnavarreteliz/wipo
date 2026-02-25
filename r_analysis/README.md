# EconGeo Analysis in R

This folder contains R scripts that replicate the core four analyses of Economic Complexity and Geographic Concentration, based on the `EconGeo` package by Pierre-Alexandre Balland.

## Analyses Replicated
These scripts follow the methodology of the four core tutorials provided by the author:
1.  **01_concentration.R**: Calculates Revealed Comparative Advantage (RCA) and Location Quotients to measure geographic concentration.
2.  **02_relatedness.R**: Computes the Relatedness (Proximity) matrix between different fields of innovation.
3.  **03_complexity.R**: Computes the Knowledge Complexity Index (KCI), equivalent to ECI (for countries) and PCI (for fields) using the Method of Reflections.
4.  **04_diversification.R**: Calculates Relatedness Density to identify strategic diversification opportunities for specific regions/countries.

## How to Run
1.  Ensure you have R installed.
2.  Open R in this directory or set the working directory to `r_analysis/`.
3.  Run the setup script to install dependencies:
    ```r
    source("setup.R")
    ```
4.  Run the scripts in order:
    ```r
    source("01_concentration.R")
    source("02_relatedness.R")
    source("03_complexity.R")
    source("04_diversification.R")
    ```

## Data Requirements
The scripts expect the original WIPO data in the `data/` folder at the root of the project (specifically `outputs.parquet`).

## Reference
Library GitHub: [https://github.com/PABalland/EconGeo](https://github.com/PABalland/EconGeo)
Tutorials: [https://pierre-alexandreballand.com/tutorials.html](https://pierre-alexandreballand.com/tutorials.html)
