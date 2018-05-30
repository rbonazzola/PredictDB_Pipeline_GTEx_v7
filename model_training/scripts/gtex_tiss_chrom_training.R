setwd("/group/im-lab/nas40t2/scott/gtex_v7_imputed_europeans/model_training/scripts/")
source("gtex_v7_nested_cv_elnet.R")
"%&%" <- function(a,b) paste(a,b, sep='')

argv <- commandArgs(trailingOnly = TRUE)
tiss <- argv[1]
chrom <- argv[2]

shared_data_folder <- "/apps/shared_data/"

snp_annot_file <- shared_data_folder %&% "annotations/" %&% "gtex_v8_eur_shapeit2_phased_maf01_snp_annot.chr" %&% chrom %&% ".txt" 
gene_annot_file <- shared_data_folder %&% "annotations/" %&% "gencode_v26_parsed.txt" 
genotype_file <- shared_data_folder %&% "genotypes/" %&% "gtex_v8_eur_shapeit2_phased_maf01.chr" %&% chrom %&% ".txt.gz"
covariates_file <- shared_data_folder %&% "covariates/" %&% tiss %&% "_Analysis.combined_covariates.txt"
expression_file <- shared_data_folder %&% "expressions/" %&% tiss %&% "_Analysis.expression.txt"
prefix <- tiss %&% "_nested_cv"

main(snp_annot_file, gene_annot_file, genotype_file, expression_file, covariates_file, as.numeric(chrom), prefix, null_testing=FALSE)


