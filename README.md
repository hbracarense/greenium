# Green Bond Pricing in an Emerging Market: Evidence from Brazil

[![DOI](https://zenodo.org/badge/1204422304.svg?style=flat)](https://zenodo.org/badge/latestdoi/1204422304)

## Abstract

Testing for a greenium in emerging bond markets is challenging because standard pricing methodologies were developed for large, liquid, hard-currency markets. Brazil offers a relevant case: its corporate debt market is relatively thin, largely local-currency based, and dominated by hybrid fixed-and-floating instruments. Against this background, this paper develops an approach to identify greenium in Brazilian debentures and applies it to thirteen green issuances between 2015 and 2021. The Brazilian green bond market is first characterized through descriptive statistics, and yield curves are then constructed for comparative baskets of conventional securities. The results show that a greenium is not pervasive in the Brazilian market: only three debentures are priced below the fitted yield curve, while the remaining securities display conventional new-issuance premiums. These findings are consistent with the mixed evidence on green bond pricing in emerging markets and suggest that green labeling alone does not systematically reduce financing costs in thin local-currency debt markets. More broadly, the methodology developed here may offer a useful framework for analyzing green bond pricing in comparable emerging-market contexts.

## Overview

This repository contains the empirical materials, intermediate databases, and Python/R scripts used in the study **_Green Bond Pricing in an Emerging Market: Evidence from Brazil_**. It is organized as a **research replication package** intended to accompany an academic manuscript, dissertation chapter, preprint, or journal submission.

The repository combines original source files, treated databases, Central Bank *Focus Bulletin* PDFs, and Python/R scripts used to generate descriptive figures, duration-yield visualizations, and implicit inflation curve outputs. Taken together, these materials document the workflow underlying the paper's graphical, descriptive, and bond-level empirical exercises.

## Scope of the replication package

This repository is centered on four analytical components:

1. **Market characterization of labeled debt issuance in Brazil (2015–2021)**, including descriptive figures on issuance volume, instrument composition, issuer type, and sectoral distribution.
2. **Implicit inflation curve estimation and visualization**, based on parametrized term-structure inputs used in the study.
3. **Duration-yield comparison for a selected green bond**, contrasting it with comparable vanilla instruments.
4. **Yield-equation solving for selected debentures**, implemented through explicit cash-flow equations and numerical root finding.

The codebase is written in **Python/R** and relies primarily on Excel, CSV, and PDF source files stored in the `Data/` directory.

## Repository structure

```text
.
├── Data/
│   ├── Bonds/
|   |   ├── Cash flows/
|   |   ├── Descriptions/
│   │   └── Miscellaneous/
│   ├── Databases/
│   │   ├── Original/
│   │   └── Treated/
│   └── Focus Bulletin/
└── Scripts/
    └── Web scrapper/
    |   ├── chromedriver.exe
    |   ├── functions.py
    |   └── main.py
    ├── Calculations and figures/
    |   ├── curva_inflacao.R
    |   ├── dissertacao_artigo.R
    |   ├── equacao.R
    |   └── graficos_ingles.R
```
### `Data/Bonds/Cash flows/`
Contains spreadsheets presenting the entire cash flow scheme,from emission to maturity, for each bond in the database.

### `Data/Bonds/Descriptions/`
Contains, in PDF file, general informations of each bond in the database.

### `Data/Bonds/Miscellaneous/`
Contains auxiliary bond-related files, including spreadsheets and exports used during the construction of the study database. This folder includes raw and semi-processed materials such as debenture characteristics, price files, and bond classification spreadsheets.

### `Data/Databases/Original/`
Contains original source databases used in the empirical workflow. These include, among others:

- `Pasta1.xlsx`, used directly by `graficos_ingles.R` to generate several publication figures;
- original bond databases such as `bonds_db_3m.xlsx` and `bonds_db_6m.xlsx`;
- macro-financial and market inputs such as `contratos_di_futuro.csv`, `cpiprices.xlsx`, and zero-curve files.

### `Data/Databases/Treated/`
Contains processed datasets used more directly by the analytical scripts. Notable files include:

- `dissertacao.xlsx`;
- `duration_db.xlsx`, used by `dissertacao_artigo.R`;
- treated versions of `green_bonds.xlsx` and other intermediate outputs.

### `Data/Focus Bulletin/`
Contains PDF issues of the Brazilian Central Bank's **Focus Bulletin** used as source material in the original research workflow.

### `Scripts/Web scrapper`
Written in Python, contains the web scrapper created to automate the extraction of data from bonds databases.

### `Scripts/Web scrapper/crhomedriver.exe`
The version of the Selenium webdriver employed.

### `Scripts/Web scrapper/functions.py`
Creates the functions utilized in the ETL process.

### `Scripts/Web scrapper/main.py`
Executes the ETL process.

### `Scripts/Calculations and figures/graficos_ingles.R`
This is the main figure-generation script for the English-language graphical outputs. It produces a set of publication-style figures, including:

- **Figure 1**: emissions and market volume over time;
- **Figure 2**: composition by instrument type;
- **Figure 3**: issuer type composition;
- **Figure 4**: sectoral composition;
- **Figure 5**: implicit inflation curve.

The script reads directly from `Pasta1.xlsx` and also embeds the inflation-curve computation used to generate the fifth figure.

### `Scripts/Calculations and figures/curva_inflacao.R`
A standalone version of the implicit inflation curve routine. It computes the curve from predefined term-structure parameters and exports the corresponding figure separately from the broader English-graphics script.

### `Scripts/Calculations and figures/dissertacao_artigo.R`
Generates the duration-yield plot for a selected green bond (`OMNG12`) against comparable vanilla bonds using `duration_db.xlsx`. This script is associated with the bond-level visual comparison exercise reported in the study.

### `Scripts/Calculations and figures/equacao.R`
Implements explicit pricing/yield equations for a set of selected bonds and solves them numerically using `rootSolve::uniroot.all()`. This script mixes hard-coded cash-flow equations with spreadsheet inputs and functions as a specialized analytical routine rather than as a fully generalized estimation pipeline.

## Data provenance and language note

Two features of this replication package should be highlighted explicitly.

First, **`dados.xlsx` is not stored as a standalone source file in the repository**. This should not be interpreted as a missing external dataset. In the original workflow, `dados.xlsx` is **generated from sheets contained in `dissertacao.xlsx`**, which is present in `Data/Databases/Treated/`.

Second, **some textual source materials remain in Portuguese**, especially:

- bond descriptions and bond-related labels inherited from the original database construction process;
- the Brazilian Central Bank **Focus Bulletin** materials.

These materials were intentionally preserved in their original language to maintain fidelity to the original publication workflow and source documentation.

## Reproducibility notes

This repository is substantially more complete than a minimal code-only archive, but it is **not yet a fully parameterized, one-command replication environment**. In particular:

- several scripts use `setwd()` with local hard-coded Windows paths;
- some scripts assume that required input files are placed in the working directory rather than being referenced by project-relative paths;
- `equacao.R` depends on `dados.xlsx`, which must be generated from `dissertacao.xlsx` before that script can be reproduced end-to-end in a clean environment;
- the scripts are best understood as research scripts prepared from the author's working environment, rather than as a production-grade software package.

Accordingly, this repository should be interpreted as a **research replication package with documented source files**, not as a fully containerized reproducibility stack.

## Software requirements

The scripts rely on R and the following packages:

- `readxl`
- `tidyverse`
- `rootSolve`

A minimal installation command is:

```r
install.packages(c("readxl", "tidyverse", "rootSolve"))
```

## Suggested replication workflow

A practical way to reproduce the main outputs is:

1. Clone or download the repository.
2. Set the working directory to the project root.
3. Update the scripts to replace hard-coded `setwd()` calls with your local project path or, preferably, project-relative paths.
4. Confirm that the input files are available in the expected directories.
5. When reproducing the routines in `equacao.R`, generate `dados.xlsx` from the relevant sheets in `dissertacao.xlsx`.
6. Run the scripts in the following order:

```r
# Descriptive figures for the paper
source("Scripts/graficos_ingles.R")

# Standalone inflation curve
source("Scripts/curva_inflacao.R")

# Duration-yield comparison figure
source("Scripts/dissertacao_artigo.R")

# Bond pricing / root-solving routines
source("Scripts/equacao.R")
```

## Expected outputs

Depending on the script executed, the repository generates publication-style image files such as:

- `figure1.jpeg`
- `figure2.jpeg`
- `figure3.jpeg`
- `figure4.jpeg`
- `figure5.jpeg`
- `figure6.jpeg`
- `graph5.png`

These correspond to the figures created by the plotting scripts and can be used in manuscript preparation, dissertation chapters, appendices, or presentation materials.

## Limitations

For transparency, a few limitations should be stated explicitly:

- the repository contains research scripts rather than a package with functions, tests, and dependency management;
- file-path handling is environment-specific in the current version;
- some outputs rely on intermediate object naming conventions from the author's original workspace;
- `dissertacao_artigo.R` and `equacao.R` reflect direct analytical scripting and may require light manual adjustment in a fresh environment;
- there is no `renv`, `packrat`, Docker, or automated orchestration file included at this stage.

These limitations do not prevent scholarly inspection of the workflow, but they do mean that full machine-independent reproducibility still requires modest manual setup.

## Code Availability Statement

The code required to reproduce the graphical and numerical routines documented in this study is provided in this repository in the `Scripts/` directory. The code is made available for purposes of academic transparency and replication. Because the scripts reflect the author's original research environment, minor path adjustments and routine setup may be necessary before execution in a different local environment.

## Data Availability Statement

The repository includes the main source and treated files used in the empirical workflow, including spreadsheets, bond-related materials, and Central Bank *Focus Bulletin* PDFs. One intermediate file, `dados.xlsx`, is not stored as an independent archival input because it is generated from sheets contained in `dissertacao.xlsx`, which is included in the repository. Some textual metadata and documentary source materials remain in Portuguese because they were preserved from the original research workflow and publication materials.

## Language and source-document statement

To preserve consistency with the original Brazilian empirical context, some repository components remain in Portuguese. This applies in particular to bond descriptions inherited from the source databases and to the Central Bank *Focus Bulletin* documents. These elements were intentionally not translated, both to maintain fidelity to the original research materials and to avoid introducing interpretive changes into documentary inputs.

## Citation

If you use this repository in academic work, please cite the associated paper and, when appropriate, the repository release. A repository-oriented BibTeX entry is provided below and can be updated with the final release URL, DOI, or version number.

```bibtex
@misc{greenium_brazil_replication_2026,
  author       = {Author Name},
  title        = {Greenium and Sustainable Development Financing in Brazil: Replication Package},
  year         = {2026},
  publisher    = {GitHub},
  note         = {Replication materials for the study ``Greenium and Sustainable Development Financing in Brazil''},
  url          = {https://github.com/your-repository}
}
```

A paper-oriented placeholder entry is also provided below.

```bibtex
@article{author2026greenium,
  author       = {Author Name},
  title        = {Green Bond Pricing in an Emerging Market: Evidence from Brazil},
  journal      = {Journal Name},
  year         = {2026},
  volume       = {xx},
  number       = {x},
  pages        = {xx--xx},
  note         = {Forthcoming / under review}
}
```

## Disclaimer

This repository is provided for academic transparency and research replication purposes. The code reflects the empirical workflow used in the original study and should be interpreted as **research code**. Users are encouraged to inspect, validate, and adapt the scripts to their own computing environments before reusing them in downstream applications.
