#!/bin/bash

#SBATCH --job-name=gtex_whole_blood_chr2_test
#SBATCH --time=36:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem 12G
#SBATCH --output=logs/%x.o%j.log
#SBATCH --error=logs/%x.e%j.err

if [ ${SLURM_SUBMIT_DIR} ]; then
  cd ${SLURM_SUBMIT_DIR}
fi

gsutil cp gs://predictdb/gtex_v8/prepared_data/genotypes/gtex_v8_eur_shapeit2_phased_maf01.chr2.txt.gz /apps/shared_data/genotypes

source activate R
Rscript Whole_Blood_test.R
source deactivate
