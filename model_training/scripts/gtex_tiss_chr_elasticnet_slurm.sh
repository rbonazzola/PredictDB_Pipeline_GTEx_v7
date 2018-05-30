#!/bin/bash

#SBATCH --time=36:00:00
#SBATCH --cpus-per-task=4
#SBATCH -l mem=12G
#SBATCH --output=logs/%x.o%j.log
#SBATCH --error=logs/%x.e%j.err

DATA_FOLDER="/mnt/disks/data/prepared_data_for_model_training

# Download files (not necessary when I use the shared folder in the controller)
# gsutil cp gs://predictdb/gtex_v8/prepared_data/expressions/${tiss}_Analysis.expression.txt ${DATA_FOLDER}/expressions/${tiss}
# gsutil cp gs://predictdb/gtex_v8/prepared_data/annotations/gtex_v8_eur_shapeit2_phased_maf01_snp_annot.chr${chrom}.txt ${DATA_FOLDER}/annotations/${chrom}
# gsutil cp gs://predictdb/gtex_v8/prepared_data/genotypes/gtex_v8_eur_shapeit2_phased_maf01.chr${chrom}.txt.gz ${DATA_FOLDER}/genotypes

Rscript gtex_tiss_chrom_training.R ${tiss} ${chrom}
