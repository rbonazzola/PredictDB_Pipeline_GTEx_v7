#!/bin/bash

#SBATCH --time=36:00:00
#SBATCH --cpus-per-task=8
#SBATCH --mem 30G
#SBATCH --output=../logs/%x.o%j.log
#SBATCH --error=../logs/%x.e%j.err

DATA_FOLDER="/apps/shared_data"

# Download files (not necessary when I use the shared folder in the controller)
# gsutil cp gs://predictdb/gtex_v8/prepared_data/annotations/gtex_v8_eur_shapeit2_phased_maf01_snp_annot.chr${chrom}.txt ${DATA_FOLDER}/annotations/${chrom}

if [ ${SLURM_SUBMIT_DIR} ]; then
  cd ${SLURM_SUBMIT_DIR}
fi

if [ ! -e ${DATA_FOLDER}/expressions/${tiss}_Analysis.expression.txt ]; then
  echo "Downloading ${tiss}_Analysis.expression.txt..."
  gsutil cp gs://predictdb/gtex_v8/prepared_data/expressions/${tiss}_Analysis.expression.txt ${DATA_FOLDER}/expressions
fi

if [ ! -e ${DATA_FOLDER}/genotypes/gtex_v8_eur_shapeit2_phased_maf01.chr${chrom}.txt.gz ]; then
  echo "Downloading gtex_v8_eur_shapeit2_phased_maf01.chr${chrom}.txt.gz..."
  gsutil cp gs://predictdb/gtex_v8/prepared_data/genotypes/gtex_v8_eur_shapeit2_phased_maf01.chr${chrom}.txt.gz ${DATA_FOLDER}/genotypes
fi

source activate R
Rscript gtex_tiss_chrom_training.R ${tiss} ${chrom} ${n_subsplit} ${subsplit_index}
source deactivate
