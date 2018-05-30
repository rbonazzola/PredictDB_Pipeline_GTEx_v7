#!/bin/bash

#SBATCH --job-name=gtex_whole_blood_chr22_test
#SBATCH --time=36:00:00
#SBATCH --cpus-per-task=8
#SBATCH --mem 31G
#SBATCH --output=logs/%x.o%j.log
#SBATCH --error=logs/%x.e%j.err

source activate R
Rscript Whole_Blood_test.R
source deactivate
