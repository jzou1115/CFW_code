
######## Snakemake header ########
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
    input = list('/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr1.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr2.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr3.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr4.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr5.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr6.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr7.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr8.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr9.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr10.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr11.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr12.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr13.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr14.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr15.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr16.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr17.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr18.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr19.oxinfo90.Rdata', "genotypes" = c('/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr1.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr2.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr3.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr4.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr5.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr6.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr7.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr8.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr9.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr10.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr11.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr12.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr13.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr14.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr15.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr16.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr17.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr18.oxinfo90.Rdata', '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/chr19.oxinfo90.Rdata')),
    output = list('/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/kinship_matrices.RData', "output" = '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/kinship_matrices.RData'),
    params = list(),
    wildcards = list(),
    threads = 1,
    log = list(),
    resources = list(),
    config = list("outdir" = '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc', "chromosomes" = 'data/chromosomes.txt', "phenotypes" = 'data/phenotypes.txt', "qtls" = '/u/home/j/jzou1115/project-zarlab/CFW/confidence_intervals/data/qtls/qtls_decorrelated_threshold_uc.txt', "kinship" = '/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_uc/genotypes/kinship_matrices.RData', "qtl_ids" = 'data/qtls_decorrelated_info90_uc.txt', "dosages" = '/u/home/j/jzou1115/project-zarlab/CFW/MegaAnalysis_CFW_2019/genotypes/oxinfo90/uc.chr{chr}.oxinfo90.dosages.gz', "annot" = '/u/home/j/jzou1115/project-zarlab/CFW/MegaAnalysis_CFW_2019/genotypes/oxinfo90/combined.chr{chr}.oxinfo90.annot', "prune" = '/u/home/j/jzou1115/project-zarlab/CFW/MegaAnalysis_CFW_2019/oxinfo90/LDprunedSNPs/combined.chr{chr}.prune.in', "pheno" = '/u/home/j/jzou1115/project-zarlab/CFW/confidence_intervals/data/phenotypes/pheno.uc.txt', "pheno_all" = '/u/home/j/jzou1115/project-zarlab/CFW/confidence_intervals/data/phenotypes/pheno.combined.txt'),
    rule = 'makeKinship',
    bench_iteration = as.numeric(NA),
    scriptdir = '/u/project/zarlab/jzou1115/CFW/MegaAnalysis_CFW_Code/confidence_interval_pipeline_pruned/scripts',
    source = function(...){
        wd <- getwd()
        setwd(snakemake@scriptdir)
        source(...)
        setwd(wd)
    }
)


######## Original script #########
genotypes <- snakemake@input[["genotypes"]]
out <- snakemake@output[["output"]]
print(out)

kinship.matrices <- list()
kinship.matrices[["K.chr"]] <- list()

for(genoF in genotypes){
	load(genoF)
	print(genoF)

	base <- basename(genoF)
	tokens <- strsplit(base, split=".", fixed=T)
	chrm <- tokens[[1]][1]
	chrm <- substr(chrm, 4, nchar(chrm))

	ids = dosages$ids
	dos = dosages$dosages
	K = cov(dos, use="complete.obs")
	print(length(ids))
	print(dim(K))
	row.names(K) = ids
	colnames(K) = ids
	n = nrow(dos)

	kinship.matrices$K.chr[[chrm]] = list("K"=K, "n"=n)	

}

save(kinship.matrices, file=out)

#> load("/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/genotypes/chr1.oxinfo90.Rdata")
#> ls()
#[1] "dosages"
#> names(dosages)
#[1] "ids"     "dosages" "map"  
#> names(dosages$map)
#[1] "rsid" "bp"   "chr" 
#> length(dosages$ids)
#[1] 3234
#> dim(dosages$dosages)


#> ls()
#[1] "kinship.matrices"
#> names(kinship.matrices)
#[1] ""      "K.chr"
#> names(kinship.matrices$K.chr)
# [1] "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10" "11" "12" "13" "14" "15"
#[16] "16" "17" "18" "19"
#> names(kinship.matrices$K.chr$1)
#Error: unexpected numeric constant in "names(kinship.matrices$K.chr$1"
#> names(kinship.matrices$K.chr$"1")
#[1] "K" "n"
#> names(kinship.matrices$K.chr$"1"$K)
#> names(kinship.matrices$K.chr$"1"$n)
#NULL
#> dim(kinship.matrices$K.chr$"1"$K)
#[1] 3234 3234
#> kinship.matrices$K.chr$"1"$n
#[1] 2874436
