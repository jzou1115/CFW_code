#!/bin/sh
# properties = {"type": "single", "rule": "genomeScans", "local": false, "input": ["/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/mm/emma.fc.uncond.freeze.RData"], "output": ["/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/fc.uncond.freeze.1.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/fc.uncond.freeze.2.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/fc.uncond.freeze.3.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/fc.uncond.freeze.4.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/fc.uncond.freeze.5.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/fc.uncond.freeze.6.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/fc.uncond.freeze.7.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/fc.uncond.freeze.8.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/fc.uncond.freeze.9.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/fc.uncond.freeze.10.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/fc.uncond.freeze.11.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/fc.uncond.freeze.12.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/fc.uncond.freeze.13.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/fc.uncond.freeze.14.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/fc.uncond.freeze.15.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/fc.uncond.freeze.16.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/fc.uncond.freeze.17.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/fc.uncond.freeze.18.permute.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/fc.uncond.freeze.19.permute.RData"], "wildcards": {"pheno": "fc.uncond.freeze"}, "params": {"scan_dir": "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans", "g_dir": "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/genotypes"}, "log": [], "threads": 1, "resources": {}, "jobid": 41, "cluster": {"queue": "highp", "memory": "20G", "name": "genomeScans", "output": "logs/genomeScans.fc.uncond.freeze.out", "error": "logs/genomeScans.fc.uncond.freeze.err", "mail": "ae", "time": "23:59:59", "cores": "1"}}
 cd /u/project/zarlab/jzou1115/CFW/MegaAnalysis_CFW_Code/confidence_interval_pipeline_pruned && \
/u/home/j/jzou1115/project-ernst/software/anaconda3/bin/python3.7 \
-m snakemake /u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/scans/fc.uncond.freeze.1.permute.RData --snakefile /u/project/zarlab/jzou1115/CFW/MegaAnalysis_CFW_Code/confidence_interval_pipeline_pruned/Snakefile \
--force -j --keep-target-files --keep-remote \
--wait-for-files /u/project/zarlab/jzou1115/CFW/MegaAnalysis_CFW_Code/confidence_interval_pipeline_pruned/.snakemake/tmp.z4ktad_9 /u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned/mm/emma.fc.uncond.freeze.RData --latency-wait 600 \
 --attempt 1 --force-use-threads \
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
   --allowed-rules genomeScans --nocolor --notemp --no-hooks --nolock \
--mode 2  && touch /u/project/zarlab/jzou1115/CFW/MegaAnalysis_CFW_Code/confidence_interval_pipeline_pruned/.snakemake/tmp.z4ktad_9/41.jobfinished || (touch /u/project/zarlab/jzou1115/CFW/MegaAnalysis_CFW_Code/confidence_interval_pipeline_pruned/.snakemake/tmp.z4ktad_9/41.jobfailed; exit 1)

