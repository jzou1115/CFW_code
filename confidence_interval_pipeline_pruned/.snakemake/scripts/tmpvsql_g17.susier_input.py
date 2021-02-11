
######## Snakemake header ########
import sys; sys.path.extend(['/u/home/j/jzou1115/project-ernst/software/anaconda3/lib/python3.7/site-packages', '/u/project/zarlab/jzou1115/CFW/MegaAnalysis_CFW_Code/confidence_interval_pipeline_pruned/scripts']); import pickle; snakemake = pickle.loads(b'\x80\x03csnakemake.script\nSnakemake\nq\x00)\x81q\x01}q\x02(X\x05\x00\x00\x00inputq\x03csnakemake.io\nInputFiles\nq\x04)\x81q\x05Xs\x00\x00\x00/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/confidence_intervals/CI_pruned.txtq\x06a}q\x07X\x06\x00\x00\x00_namesq\x08}q\tsbX\x06\x00\x00\x00outputq\ncsnakemake.io\nOutputFiles\nq\x0b)\x81q\x0c(X\x89\x00\x00\x00/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/finemapping/input/tail.length.4.54882089_pruned_sorted.zq\rX\x8a\x00\x00\x00/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/finemapping/input/tail.length.4.54882089_pruned_sorted.ldq\x0ee}q\x0fh\x08}q\x10sbX\x06\x00\x00\x00paramsq\x11csnakemake.io\nParams\nq\x12)\x81q\x13(X\x16\x00\x00\x00tail.length.4.54882089q\x14Xb\x00\x00\x00/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/finemapping/inputq\x15G?\xeeffffffXZ\x00\x00\x00/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypesq\x16e}q\x17(h\x08}q\x18(X\x03\x00\x00\x00qtlq\x19K\x00N\x86q\x1aX\x06\x00\x00\x00outdirq\x1bK\x01N\x86q\x1cX\x08\x00\x00\x00quantileq\x1dK\x02N\x86q\x1eX\x05\x00\x00\x00pruneq\x1fK\x03N\x86q uh\x19h\x14h\x1bh\x15h\x1dG?\xeeffffffh\x1fh\x16ubX\t\x00\x00\x00wildcardsq!csnakemake.io\nWildcards\nq")\x81q#h\x14a}q$(h\x08}q%X\x01\x00\x00\x00qq&K\x00N\x86q\'sh&h\x14ubX\x07\x00\x00\x00threadsq(K\x01X\t\x00\x00\x00resourcesq)csnakemake.io\nResources\nq*)\x81q+(K\x01K\x01e}q,(h\x08}q-(X\x06\x00\x00\x00_coresq.K\x00N\x86q/X\x06\x00\x00\x00_nodesq0K\x01N\x86q1uh.K\x01h0K\x01ubX\x03\x00\x00\x00logq2csnakemake.io\nLog\nq3)\x81q4}q5h\x08}q6sbX\x06\x00\x00\x00configq7}q8(X\x06\x00\x00\x00outdirq9XP\x00\x00\x00/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_ucq:X\x0b\x00\x00\x00chromosomesq;X\x14\x00\x00\x00data/chromosomes.txtq<X\n\x00\x00\x00phenotypesq=X\x13\x00\x00\x00data/phenotypes.txtq>X\x04\x00\x00\x00qtlsq?Xg\x00\x00\x00/u/home/j/jzou1115/project-zarlab/CFW/confidence_intervals/data/qtls/qtls_decorrelated_threshold_uc.txtq@X\x07\x00\x00\x00kinshipqAXq\x00\x00\x00/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/kinship_matrices.RDataqBX\x07\x00\x00\x00qtl_idsqCX$\x00\x00\x00data/qtls_decorrelated_info90_uc.txtqDX\x07\x00\x00\x00dosagesqEXt\x00\x00\x00/u/home/j/jzou1115/project-zarlab/CFW/MegaAnalysis_CFW_2019/genotypes/oxinfo90/combined.chr{chr}.oxinfo90.dosages.gzqFX\x05\x00\x00\x00annotqGXo\x00\x00\x00/u/home/j/jzou1115/project-zarlab/CFW/MegaAnalysis_CFW_2019/genotypes/oxinfo90/combined.chr{chr}.oxinfo90.annotqHX\x05\x00\x00\x00pruneqIXl\x00\x00\x00/u/home/j/jzou1115/project-zarlab/CFW/MegaAnalysis_CFW_2019/oxinfo90/LDprunedSNPs/combined.chr{chr}.prune.inqJX\x05\x00\x00\x00phenoqKXW\x00\x00\x00/u/home/j/jzou1115/project-zarlab/CFW/confidence_intervals/data/phenotypes/pheno.uc.txtqLX\t\x00\x00\x00pheno_allqMX]\x00\x00\x00/u/home/j/jzou1115/project-zarlab/CFW/confidence_intervals/data/phenotypes/pheno.combined.txtqNuX\x04\x00\x00\x00ruleqOX\x0c\x00\x00\x00susier_inputqPX\x0f\x00\x00\x00bench_iterationqQNX\t\x00\x00\x00scriptdirqRX`\x00\x00\x00/u/project/zarlab/jzou1115/CFW/MegaAnalysis_CFW_Code/confidence_interval_pipeline_pruned/scriptsqSub.'); from snakemake.logging import logger; logger.printshellcmds = False; __real_file__ = __file__; __file__ = '/u/project/zarlab/jzou1115/CFW/MegaAnalysis_CFW_Code/confidence_interval_pipeline_pruned/scripts/susier_input.py';
######## Original script #########
import sys
import pandas as pd
import numpy as np
import math
import os

#EDL.12.83885241
ci_f = snakemake.input[0]
qtl = snakemake.params[0]
outdir = snakemake.params[1]
quantile = snakemake.params[2]
pruneD = snakemake.params[3]
out1 = snakemake.output[0]
out2 = snakemake.output[1]


ci= pd.read_table(ci_f)
ci = ci[ci["quantile"]==quantile]
#ci = pd.read_table("/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out/confidence_intervals/CI_decorrelatedThresholds_q95_genes.txt")
z_dir = "/u/home/j/jzou1115/project-zarlab/CFW/MegaAnalysis_CFW_2019_Summary_Statistics/COMBINED"
g_dir = "/u/home/j/jzou1115/project-zarlab/CFW/MegaAnalysis_CFW_2019/genotypes/oxinfo90"
#outdir = "/u/home/j/jzou1115/project-zarlab/CFW/Finemapping_Analysis_decorrelated/input"

qtl_tokens = qtl.split(".")
phenotype = ".".join(qtl_tokens[0:len(qtl_tokens)-2])
chrm = int(qtl_tokens[-2])
bp = int(qtl_tokens[-1])

sub = ci[(ci["phenotype"]==phenotype) & (ci["chr"]==chrm) & (ci["bp"]==bp)]
i = sub.index[0]
start = ci.loc[i, "from.bp"]
end = ci.loc[i, "to.bp"]
print(start, end)

d_f = phenotype+".combined.assoc.txt.gz"
d = pd.read_table(os.path.join(z_dir, d_f))
d = d[d["chr"]==chrm]
print(d.shape)
#subset to snps in confidence interval region
d = d[(d["ps"]<= end) & (d["ps"]>= start)]
print(d.shape)
d.index = d["rs"]
d["z"] = d["beta"]/d["se"]
num_snps = d.shape[0]
d = d.dropna(subset=["z"])
print("Dropping %d snps with missing z" % (num_snps - d.shape[0]))
print(d.shape)

#prune snps
#pruneF = "/u/home/j/jzou1115/project-zarlab/CFW/confidence_intervals_pruned/snps/combined.chr"+str(chrm)+".prune.in" #includes pruned snps + qtls
pruneF = os.path.join(pruneD, "chr"+str(chrm)+".oxinfo90.txt")
prune = pd.read_table(pruneF, header=None)
snps = list(set(d["rs"]).intersection(set(prune[0])))

#subset to pruned snps
d = d.loc[snps, :]

#sort by position
d = d.sort_values(by="ps")
snps = d.index
z_out = d.loc[snps, ["rs", "z"]]
#z_out_f = "_".join([str(t) for t in [phenotype, str(chrm), str(bp)]])+"_pruned_sorted.z"
z_out.to_csv(os.path.join(outdir, out1), sep="\t", header=True, index=False)
print("output z")

snps = list(d.index)

#read genotypes and subset to region
g_f = "combined.chr"+str(chrm)+".oxinfo90.dosages.gz"
g = pd.read_table(os.path.join(g_dir, g_f), index_col = 0, header=None)
g = g.iloc[:, 2:] #skip allele columns
g = g.loc[snps,:]
g = g.transpose()
ld = g.corr(method="pearson")
#ld_out_f = "_".join([str(t) for t in [phenotype, str(chrm), str(bp)]])+"_pruned_sorted.ld"
ld.to_csv(os.path.join(outdir, out2), sep="\t", header=True, index=True, index_label=False)
    
