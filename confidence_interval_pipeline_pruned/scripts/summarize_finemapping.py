import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import glob
import os
import gzip
from scipy.stats import pearsonr

f = snakemake.input["f"]

datadir='/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/finemapping/input'
g_dir="/u/home/j/jzou1115/project-zarlab/CFW/MegaAnalysis_CFW_2019/genotypes/oxinfo90/"
outdir = "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/finemapping/output/"


qtlid = os.path.basename(f).split("_")[0]

# get total number of snps input into finemapping
d = pd.read_table(os.path.join(datadir, qtlid+"_pruned_sorted.z"))

# get snps in causal sets
try:
    d2 = pd.read_table(f, header=None)
    d2_snps = d2[0]
    d2_snps = [str(s) for s in d2_snps]
except:
	d2_snps = d["rs"]
    d2_snps = [str(s) for s in d2_snps]
#get dosages in window
tokens = qtlid.split(".")
chrm = tokens[-2]
bp = int(tokens[-1])

window=6000000
start_ci = max(0, bp - window)
end_ci = bp + window

print(start_ci, end_ci)
locus = []
dosages = []
with gzip.open(os.path.join(g_dir,"combined.chr"+str(chrm)+".oxinfo90.dosages.gz"),'rt') as f:
    for line in f:

        tokens = line.split("\t")
        snp_tokens = tokens[0].split("_")
        pos = int(snp_tokens[1])
        if pos >= start_ci and pos <= end_ci:
            locus.append(tokens[0])

            dos = tokens[3:]
            dos = [float(d) for d in dos]
            dosages.append(dos)

print(len(locus))
dosages = pd.DataFrame(dosages)
dosages.index = locus


# get snps that are in LD with input/output
a_snps = set([])
f_snps = set([])
for ref_snp in d["rs"]:
    print(ref_snp)
    for snp in dosages.index:
        r, p = pearsonr(dosages.loc[ref_snp,:], dosages.loc[snp,:])
        r2 = r*r
        if r2>=.99:
            a_snps.add(snp)
            if str(ref_snp) in d2_snps:
                f_snps.add(snp)

#write output files
out1 = open(os.path.join(outdir, qtlid+"_all_snps.txt"), "w")
for s in a_snps:
    out1.write(s+"\n")
out1.close()

out2 = open(os.path.join(outdir, qtlid+"_finemap_snps.txt"), "w")
for s in f_snps:
    out2.write(s+"\n")
out2.close()
       

