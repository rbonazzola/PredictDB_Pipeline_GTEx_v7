#!/bin/bash

for tiss in `cat gtex_tissues.txt`
do
    echo $tiss
    for chrom in {1..22}
    do
        echo -e "    $chrom"
        sbatch --export=tiss=${tiss},chrom=${chrom} --job-name=gtex_training_${tiss}_${chrom} gtex_tiss_chr_elasticnet_slurm.sh 
        sleep .5
    done
done
