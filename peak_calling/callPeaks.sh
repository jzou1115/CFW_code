#!/bin/sh
#$ -N peaks
#$ -cwd
#$ -o output
#$ -e error
#$ -V
#$ -l h_data=5G,highp,h_rt=23:59:59
#$ -m a
#$ -M jzou1115
#$ -t 2-100:1
i=$SGE_TASK_ID

#input=/u/home/j/jzou1115/project-zarlab/CFW/ox1_ox2_splits/gemma_out/tibia/ox1_tibia_${i}.assoc.peakInput.txt
#output=/u/home/j/jzou1115/project-zarlab/CFW/ox1_ox2_splits/gemma_out/tibia/ox1_tibia_${i}.assoc.peaks.txt
#perl callPeaks.pl -f $input -s 1000 -t 3 -d 6 -e 3 > $output

#gzip $output


input=/u/home/j/jzou1115/project-zarlab/CFW/ox1_ox2_splits/gemma_out/tibia/ox2_tibia_${i}.assoc.peakInput.txt
output=/u/home/j/jzou1115/project-zarlab/CFW/ox1_ox2_splits/gemma_out/tibia/ox2_tibia_${i}.assoc.peaks.txt
perl callPeaks.pl -f $input -s 1000 -t 3 -d 6 -e 3 > $output

gzip $output
