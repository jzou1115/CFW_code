#!/bin/sh
# properties = {"type": "single", "rule": "run_susier", "local": false, "input": ["/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_ox_redo/finemapping/input/TA.12.83514944_pruned_sorted.z", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_ox_redo/finemapping/input/TA.12.83514944_pruned_sorted.ld"], "output": ["/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_ox_redo/finemapping/output/TA.12.83514944.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_ox_redo/finemapping/output/TA.12.83514944.png", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_ox_redo/finemapping/output/TA.12.83514944_snps.txt"], "wildcards": {"q": "TA.12.83514944"}, "params": {"prefix": "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_ox_redo/finemapping/output/TA.12.83514944"}, "log": [], "threads": 1, "resources": {}, "jobid": 43, "cluster": {"queue": "highp", "memory": "30G", "name": "run_susier", "output": "logs/run_susier.q=TA.12.83514944.out", "error": "logs/run_susier.q=TA.12.83514944.err", "mail": "a", "time": "23:59:59", "cores": "1"}}
 cd /u/project/zarlab/jzou1115/CFW/MegaAnalysis_CFW_Code/confidence_interval_pipeline_pruned && \
/u/home/j/jzou1115/project-ernst/software/anaconda3/bin/python3.7 \
-m snakemake /u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_ox_redo/finemapping/output/TA.12.83514944_snps.txt --snakefile /u/project/zarlab/jzou1115/CFW/MegaAnalysis_CFW_Code/confidence_interval_pipeline_pruned/Snakefile \
--force -j --keep-target-files --keep-remote \
--wait-for-files /u/project/zarlab/jzou1115/CFW/MegaAnalysis_CFW_Code/confidence_interval_pipeline_pruned/.snakemake/tmp.84mxe6bc /u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_ox_redo/finemapping/input/TA.12.83514944_pruned_sorted.z /u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_ox_redo/finemapping/input/TA.12.83514944_pruned_sorted.ld --latency-wait 600 \
 --attempt 1 --force-use-threads \
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
   --allowed-rules run_susier --nocolor --notemp --no-hooks --nolock \
--mode 2  && touch /u/project/zarlab/jzou1115/CFW/MegaAnalysis_CFW_Code/confidence_interval_pipeline_pruned/.snakemake/tmp.84mxe6bc/43.jobfinished || (touch /u/project/zarlab/jzou1115/CFW/MegaAnalysis_CFW_Code/confidence_interval_pipeline_pruned/.snakemake/tmp.84mxe6bc/43.jobfailed; exit 1)
