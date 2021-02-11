#!/bin/sh
# properties = {"type": "single", "rule": "run_susier", "local": false, "input": ["/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_ox_redo/finemapping/input/TA.2.155856984_pruned_sorted.z", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_ox_redo/finemapping/input/TA.2.155856984_pruned_sorted.ld"], "output": ["/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_ox_redo/finemapping/output/TA.2.155856984.RData", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_ox_redo/finemapping/output/TA.2.155856984.png", "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_ox_redo/finemapping/output/TA.2.155856984_snps.txt"], "wildcards": {"q": "TA.2.155856984"}, "params": {"prefix": "/u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_ox_redo/finemapping/output/TA.2.155856984"}, "log": [], "threads": 1, "resources": {}, "jobid": 44, "cluster": {"queue": "highp", "memory": "30G", "name": "run_susier", "output": "logs/run_susier.q=TA.2.155856984.out", "error": "logs/run_susier.q=TA.2.155856984.err", "mail": "a", "time": "23:59:59", "cores": "1"}}
 cd /u/project/zarlab/jzou1115/CFW/MegaAnalysis_CFW_Code/confidence_interval_pipeline_pruned && \
/u/home/j/jzou1115/project-ernst/software/anaconda3/bin/python3.7 \
-m snakemake /u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_ox_redo/finemapping/output/TA.2.155856984_snps.txt --snakefile /u/project/zarlab/jzou1115/CFW/MegaAnalysis_CFW_Code/confidence_interval_pipeline_pruned/Snakefile \
--force -j --keep-target-files --keep-remote \
--wait-for-files /u/project/zarlab/jzou1115/CFW/MegaAnalysis_CFW_Code/confidence_interval_pipeline_pruned/.snakemake/tmp.84mxe6bc /u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_ox_redo/finemapping/input/TA.2.155856984_pruned_sorted.z /u/home/j/jzou1115/project-zarlab/CFW/confidence_interval_pipeline_out_pruned_ox_redo/finemapping/input/TA.2.155856984_pruned_sorted.ld --latency-wait 600 \
 --attempt 1 --force-use-threads \
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
   --allowed-rules run_susier --nocolor --notemp --no-hooks --nolock \
--mode 2  && touch /u/project/zarlab/jzou1115/CFW/MegaAnalysis_CFW_Code/confidence_interval_pipeline_pruned/.snakemake/tmp.84mxe6bc/44.jobfinished || (touch /u/project/zarlab/jzou1115/CFW/MegaAnalysis_CFW_Code/confidence_interval_pipeline_pruned/.snakemake/tmp.84mxe6bc/44.jobfailed; exit 1)

