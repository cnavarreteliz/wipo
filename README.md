# WIPO Innovation Capabilities Analysis 2026

This repository provides a comprehensive framework for analyzing the **WIPO Innovation Capabilities Outlook 2026** datasets. It combines traditional economic complexity indicators with modular R-based scientific replications.

---

## Project Structure

```text
/
├── data/                    # Raw WIPO Data (Parquet format)
├── r_analysis/              # R implementation (Scientific Replication)
│   └── README.md            # [Source of Truth for R Analysis]
├── analysis.ipynb           # Quick-Start: Global Leaderboards & Chile Focus
├── analysis_ecomplexity.ipynb # Deep-Dive: Harvard py-ecomplexity Metrics
├── analysis_proximity.ipynb # Advanced: Proximity Clustering & Hierarchical UI
└── README.md                # Project Overview (Python Focus)
```

## Installation & Setup

### Python Environment (Primary)
We recommend **Anaconda** or **Miniconda** for managing dependencies.

```bash
# Core dependencies
pip install pandas numpy matplotlib ecomplexity pyarrow jupyter seaborn
```

### R Environment (Optional)
The R analysis is modular and requires the `EconGeo` package.
**For R setup instructions, see [r_analysis/README.md](./r_analysis/README.md).**

---

## Analysis Included

### 1. **`analysis.ipynb`** (Executive View)
*   **Leaderboards**: Identification of top-tier innovation ecosystems for 2023.
*   **Chile Deep-Dive**: Exhaustive analysis of Chile's evolution and strategic diversification.
*   **WIPO Replication**: Visual replication of key charts from the official 2026 outlook.

### 2. **`analysis_ecomplexity.ipynb`** (Harvard Methodology)
*   Uses the `py-ecomplexity` library to compute:
    *   **ECI / PCI**: Economic and Product Complexity Indices.
    *   **RCA**: Revealed Comparative Advantage.
    *   **COG**: Complexity Outlook Gain.
*   **Multi-Dimensional**: Analysis across Production (P), Technology (T), Science (S), and Entrepreneurial (E) dimensions.

### 3. **`analysis_proximity.ipynb`** (Clustering & Topology)
*   **Product Space**: Map of the innovation topology using `py-ecomplexity`.
*   **Hierarchical Clustering**: Uses the proximity matrix to cluster related fields.
*   **Interactive Visuals**: Glassmorphism-inspired plots for innovation relatedness.

### 4. **`r_analysis/`** (EconGeo Replication)
*   A standalone R environment replicating Pierre-Alexandre Balland's methodology.
*   Covers **Relatedness Density** and **Diversification Potential**.
*   *Please refer to the internal directory for execution.*

---

## Data Source
Datasets must be manually downloaded and placed in the `/data` folder.
🔗 **[Direct Download (WIPO Portal)](https://tind.wipo.int/record/59177?v=zip)**
