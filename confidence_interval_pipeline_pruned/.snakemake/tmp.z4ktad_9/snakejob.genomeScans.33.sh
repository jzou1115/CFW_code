#!/bin/sh
# properties = {"type": "single", "rule": "genomeScans", "local": false, "input": ["/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/mm/emma.EDL.RData"], "output": ["/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/EDL.1.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/EDL.2.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/EDL.3.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/EDL.4.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/EDL.5.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/EDL.6.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/EDL.7.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/EDL.8.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/EDL.9.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/EDL.10.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/EDL.11.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/EDL.12.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/EDL.13.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/EDL.14.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/EDL.15.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/EDL.16.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/EDL.17.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/EDL.18.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/EDL.19.permute.RData"], "wildcards": {"pheno": "EDL"}, "params": {"scan_dir": "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans", "g_dir": "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/genotypes"}, "log": [], "threads": 1, "resources": {}, "jobid": 33, "cluster": {"queue": "highp", "memory": "20G", "name": "genomeScans", "output": "logs/genomeScans.EDL.out", "error": "logs/genomeScans.EDL.err", "mail": "ae", "time": "23:59:59", "cores": "1"}}
 cd /u/project/zarlab/jzou1115/CFW/MegaAnalysis_CFW_Code/confidence_interval_pipeline_pruned && \
/u/home/j/jzou1115/project-ernst/software/anaconda3/bin/python3.7 \
-m snakemake /u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/EDL.1.permute.RData --snakefile /u/project/zarlab/jzou1115/CFW/MegaAnalysis_CFW_Code/confidence_interval_pipeline_pruned/Snakefile \
--force -j --keep-target-files --keep-remote \
--wait-for-files /u/project/zarlab/jzou1115/CFW/MegaAnalysis_CFW_Code/confidence_interval_pipeline_pruned/.snakemake/tmp.z4ktad_9 /u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/mm/emma.EDL.RData --latency-wait 600 \
 --attempt 1 --force-use-threads \
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
   --allowed-rules genomeScans --nocolor --notemp --no-hooks --nolock \
--mode 2  && touch /u/project/zarlab/jzou1115/CFW/MegaAnalysis_CFW_Code/confidence_interval_pipeline_pruned/.snakemake/tmp.z4ktad_9/33.jobfinished || (touch /u/project/zarlab/jzou1115/CFW/MegaAnalysis_CFW_Code/confidence_interval_pipeline_pruned/.snakemake/tmp.z4ktad_9/33.jobfailed; exit 1)
