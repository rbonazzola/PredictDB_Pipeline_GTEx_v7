#!/bin/bash

n_subsplit=10

for tiss in `cat gtex_tissues.txt`; do
  echo $tiss
  for chrom in {1..22}; do
    echo -e "    $chrom"
    for subsp in `seq 1 ${n_subsplit}`; do
      sbatch --export=tiss=${tiss},chrom=${chrom},n_subsplit=${n_subsplit},subsplit_index=${subsp} \
             --job-name=gtex_training_${tiss}_${chrom}_subsp${subsp}_of_${n_subsplit} gtex_tiss_chr_elasticnet_slurm.sh 
      sleep .5
    done
  done
done
