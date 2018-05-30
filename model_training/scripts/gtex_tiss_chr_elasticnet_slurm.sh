#!/bin/bash

#SBATCH --time=36:00:00
#SBATCH --cpus-per-task=4
#SBATCH -l mem=12G
#SBATCH --output=logs/%x.o%j.log
#SBATCH --error=logs/%x.e%j.err

Rscript gtex_tiss_chrom_training.R ${tiss} ${chrom}
