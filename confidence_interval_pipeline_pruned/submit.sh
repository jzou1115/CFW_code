snakemake -j 200 --cluster-config config/cluster.json --latency-wait 600 --cluster "qsub -N {cluster.name} -cwd -V -o {cluster.output} -e {cluster.error} -l h_data={cluster.memory},highp,h_rt={cluster.time} -m {cluster.mail} -pe shared {cluster.cores}"


