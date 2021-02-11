#!/bin/sh
# properties = {"type": "single", "rule": "summarize_finemapping", "local": false, "input": ["/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/finemapping/output/bmd.11.95761488_snps.txt"], "output": ["/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/finemapping/output/bmd.11.95761488_all_snps.txt", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/finemapping/output/bmd.11.95761488_finemap_snps.txt"], "wildcards": {"q": "bmd.11.95761488"}, "params": {"outdir": "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/finemapping/output/"}, "log": [], "threads": 1, "resources": {}, "jobid": 72, "cluster": {"queue": "highp", "memory": "5G", "name": "summarize_finemapping", "output": "logs/summarize_finemapping.bmd.11.95761488.out", "error": "logs/summarize_finemapping.bmd.11.95761488.err", "mail": "a", "time": "23:59:59", "cores": "1"}}
 cd /u/project/zarlab/jzou1115/CFW/MegaAnalysis_CFW_Code/confidence_interval_pipeline_pruned && \
/u/home/j/jzou1115/project-ernst/software/anaconda3/bin/python3.7 \
-m snakemake /u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/finemapping/output/bmd.11.95761488_finemap_snps.txt --snakefile /u/project/zarlab/jzou1115/CFW/MegaAnalysis_CFW_Code/confidence_interval_pipeline_pruned/Snakefile \
--force -j --keep-target-files --keep-remote \
--wait-for-files /u/project/zarlab/jzou1115/CFW/MegaAnalysis_CFW_Code/confidence_interval_pipeline_pruned/.snakemake/tmp.nan98m_n /u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/finemapping/output/bmd.11.95761488_snps.txt --latency-wait 600 \
 --attempt 1 --force-use-threads \
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
   --allowed-rules summarize_finemapping --nocolor --notemp --no-hooks --nolock \
--mode 2  && touch /u/project/zarlab/jzou1115/CFW/MegaAnalysis_CFW_Code/confidence_interval_pipeline_pruned/.snakemake/tmp.nan98m_n/72.jobfinished || (touch /u/project/zarlab/jzou1115/CFW/MegaAnalysis_CFW_Code/confidence_interval_pipeline_pruned/.snakemake/tmp.nan98m_n/72.jobfailed; exit 1)
