# WIPO Innovation Capabilities Outlook 2026 Analysis

This repository contains analysis notebooks for the **WIPO Innovation Capabilities Outlook 2026** datasets.

## Data
Original data files are not included in this repository due to their size. You must download them manually from the WIPO portal:

🔗 **[Download Data (ZIP)](https://tind.wipo.int/record/59177?v=zip)**

After downloading, extract the content into a folder named `data/` in the root of this project. The structure should look like this:

```text
/
├── data/
│   ├── README.md
│   ├── outputs.parquet
│   ├── capabilities.parquet
│   ├── densities.parquet
│   ├── field_complexities.parquet
│   ├── fields.parquet
│   ├── potentials.parquet
│   ├── unit_complexities.parquet
│   └── units.parquet
├── analysis.ipynb
└── analysis_ecomplexity.ipynb
```

## Installation

### For Beginners (Recommended)
If you have never used Python before, we recommend installing **[Anaconda](https://www.anaconda.com/download)** or **[Miniconda](https://docs.conda.io/en/latest/miniconda.html)**. These distributions include Python and the management tools necessary to set up your environment easily.

Once installed, open your terminal (or Anaconda Prompt) and run:

```bash
conda install pandas numpy matplotlib pyarrow jupyter
pip install ecomplexity
```

### For Advanced Users
If you already have Python, simply install the required libraries:

```bash
pip install pandas numpy matplotlib ecomplexity pyarrow jupyter
```

*Note: `pyarrow` is required for parquet file support.*

## Analysis Included
1. `analysis.ipynb`: General WIPO analysis, replication of report charts, and deep dive into Chile's innovation trends and evolution.
2. `analysis_ecomplexity.ipynb`: Advanced complexity analysis using the Economic Complexity methodology (Harvard's `py-ecomplexity` library) to independently compute RCA, ECI, PCI, and COG.
