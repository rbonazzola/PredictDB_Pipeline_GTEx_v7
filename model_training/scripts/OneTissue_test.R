#setwd("/group/im-lab/nas40t2/scott/gtex_v7_imputed_europeans/model_training/scripts/")
source("gtex_v7_nested_cv_elnet.R")

chrom <- 2
tissue <- "Whole_Blood"

shared_data_folder <- "/apps/shared_data/"
snp_annot_file <- shared_data_folder %&% "annotations/" %&% "gtex_v8_eur_shapeit2_phased_maf01_snp_annot.chr" %&% chrom %&% ".txt"
gene_annot_file <- shared_data_folder %&% "annotations/" %&% "gencode_v26_parsed.txt"
genotype_file <- shared_data_folder %&% "genotypes/gtex_v8_eur_shapeit2_phased_maf01.chr" %&% chrom %&% ".txt.gz"
covariates_file <- shared_data_folder %&% "covariates/" %&% tissue %&% "_Analysis.combined_covariates.txt"
expression_file <- shared_data_folder %&% "expressions/" %&% tissue %&% "_Analysis.expression.txt"

prefix1 <- tissue %&% "_nested_cv"
# prefix2 <- "Whole_Blood_nested_cv_permuted"

# main(snp_annot_file, gene_annot_file, genotype_file, expression_file, covariates_file, chrom, prefix1, null_testing=TRUE)
main(snp_annot_file, gene_annot_file, genotype_file, expression_file, covariates_file, chrom, prefix1, null_testing=FALSE)
