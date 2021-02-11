
######## snakemake preamble start (automatically inserted, do not edit) ########
library(methods)
Snakemake <- setClass(
    "Snakemake",
    slots = c(
        input = "list",
        output = "list",
        params = "list",
        wildcards = "list",
        threads = "numeric",
        log = "list",
        resources = "list",
        config = "list",
        rule = "character",
        bench_iteration = "numeric",
        scriptdir = "character",
        source = "function"
    )
)
snakemake <- Snakemake(
    input = list('/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/finemapping/input/activity.end.13.10150339_pruned_sorted.z', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/finemapping/input/activity.end.13.10150339_pruned_sorted.ld', "z" = '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/finemapping/input/activity.end.13.10150339_pruned_sorted.z', "ld" = '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/finemapping/input/activity.end.13.10150339_pruned_sorted.ld'),
    output = list('/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/finemapping/output_ref/activity.end.13.10150339_10_.80_snps.txt'),
    params = list('/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/finemapping/output_ref/activity.end.13.10150339', '10', '.80', "prefix" = '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/finemapping/output_ref/activity.end.13.10150339', "L" = '10', "coverage" = '.80'),
    wildcards = list('activity.end.13.10150339', '10', '.80', "q" = 'activity.end.13.10150339', "l" = '10', "cov" = '.80'),
    threads = 1,
    log = list(),
    resources = list(),
    config = list("outdir" = '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned', "chromosomes" = 'data/chromosomes.txt', "phenotypes" = 'data/phenotypes.txt', "qtls" = '/u/home/j/jzou1115/project-zarlab/CFW/confidence_intervals/data/qtls/qtls_decorrelated_threshold3.txt', "kinship" = '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/genotypes/kinship_matrices.RData', "qtl_ids" = 'data/qtls_decorrelated_info90_all.txt', "dosages" = '/u/home/j/jzou1115/project-zarlab/CFW/MegaAnalysis_CFW_2019/genotypes/oxinfo90/combined.chr{chr}.oxinfo90.dosages.gz', "annot" = '/u/home/j/jzou1115/project-zarlab/CFW/MegaAnalysis_CFW_2019/genotypes/oxinfo90/combined.chr{chr}.oxinfo90.annot', "prune" = '/u/home/j/jzou1115/project-zarlab/CFW/MegaAnalysis_CFW_2019/oxinfo90/LDprunedSNPs/combined.chr{chr}.prune.in', "pheno" = '/u/home/j/jzou1115/project-zarlab/CFW/confidence_intervals/data/phenotypes/pheno.combined.txt', "pheno_all" = '/u/home/j/jzou1115/project-zarlab/CFW/confidence_intervals/data/phenotypes/pheno.combined.txt', "zdir" = '/u/home/j/jzou1115/project-zarlab/CFW/MegaAnalysis_CFW_2019_Summary_Statistics/COMBINED/', "ddir" = '/u/home/j/jzou1115/project-zarlab/CFW/MegaAnalysis_CFW_2019/genotypes/oxinfo90', "study" = 'combined'),
    rule = 'run_susier_ref',
    bench_iteration = as.numeric(NA),
    scriptdir = '/u/project/zarlab/jzou1115/CFW/MegaAnalysis_CFW_Code/confidence_interval_pipeline_pruned/scripts',
    source = function(...){
        wd <- getwd()
        setwd(snakemake@scriptdir)
        source(...)
        setwd(wd)
    }
)


######## snakemake preamble end #########
library(susieR)
options(echo=TRUE)
#args <- commandArgs(trailingOnly=FALSE)

zf <-  snakemake@input[["z"]]
ldf <- snakemake@input[["ld"]]
prefix <- snakemake@params[["prefix"]]
l <- snakemake@params[["L"]]
cov <- snakemake@params[["coverage"]]

#print(args)

z = read.table(zf, header=T, sep="\t")
#print(dim(z))
rs = z$rs
#print(length(rs))

ld = read.table(ldf, header=T, sep="\t")
#print(dim(ld))
ld <- data.matrix(ld)

if(nrow(z)==1){
	write.table(rs, file=paste0(prefix,"_",  l, "_", cov,  "_snps.txt"), row.names=F, col.names=F, quote=F)
} else{
# Need to compute R (ld between snps)
#fitted_rss <- susie_rss(z$z, ld, L = as.numeric(l),
#                        estimate_residual_variance = TRUE, 
#                        estimate_prior_variance = TRUE, coverage=as.numeric(cov))
fitted_rss <- susie_rss(z$z, ld, L = 1,
                        estimate_residual_variance = TRUE,
                        estimate_prior_variance = TRUE)

#print(summary(fitted_rss)$cs)


save(fitted_rss, file=paste0(prefix, "_",  l, "_", cov , ".RData"))


variants = c()
for( set in names(fitted_rss$sets$cs)){
	vars = fitted_rss$sets$cs[set] 
	variants <- c(variants, vars)
}
variants = unlist(variants)

#print(variants)
rs = rs[variants]
write.table(rs, file=paste0(prefix,"_",  l, "_", cov,  "_snps.txt"), row.names=F, col.names=F, quote=F)

plot_f <- paste0(prefix,"_",  l, "_", cov,  ".png")
png(plot_f)
susie_plot(fitted_rss, y="PIP")
dev.off()

}
