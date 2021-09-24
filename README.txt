This repository contains code used in the preparation of the following manuscript:

https://www.biorxiv.org/content/10.1101/2021.02.05.429998v1.article-info

There are 3 main sections of analysis that are separated into three directories:

1. Computation of confidence intervals and fine-mapping of mega-analysis QTLs (confidence_interval_pipeline_pruned)

	This snakemake pipeline can be customized by changing data and paramters in the config file (E.g. config/config.yaml).  The following are required:
		outdir : base output directory for all analyses
		phenotypes: List of phenotypes
		qtls: Lead QTL table with the columns (phenotype, chromosome, position, -log10 p-value, FDR, nominal significance threshold, starting position for simulations, ending position for simulations, distance to look for simulations)
		kinship: Kinship matrices for each chromosome
		qtl_ids: List of lead QTLs (must be same as in qtls)
		dosages: Dosages of mega-analysis (used for plotting)
		annot: SNP annotation in BIMBAM format
		prune: list of pruned SNPs
		pheno: Tab separated table of phenotypes with samples in rows and phenotypes in columns
		pheno_all: Table with sample ids used in study in column "Animal_ID"
		zdir: output directory of GEMMA
		ddir: genotypes in BIMBAM format
		study: identifier for the data set being analyzed

	The config/config.yaml file is used for the mega-analysis, and the config/config_ox.yaml and config/config_uc.yaml files are used for the OX and UC datasets, respectively.

	The submit.sh script is designed to submit jobs in the snakemake pipeline to the UCLA Hoffman2 cluster (Univa Grid Engine).  Submission parameters can be changed by modifying this script and the config/cluster.json
	

2. Simulations of replication using various degrees of power (replication_simulations)
	- Simulated data was generated in simulate_replication.ipynb
	- Replication was modelled in model_replication.ipynb
	- Plots were generated using plot_replication.ipynb

3. Modeling of replication rates between OX and UC cohorts (replication)
	- Input to replication modeling was generated in make_input.ipynb
	- Replication was modelled in model_replication.ipynb
	- Summary plots were generated in plot_replication.ipynb

4. Peak calling software and script used to call peaks (peak_calling)
