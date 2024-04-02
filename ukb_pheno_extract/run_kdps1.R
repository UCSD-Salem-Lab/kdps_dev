library(dplyr)
library(data.table)
library(kdps)

heart_attack_aware = kdps(phenotype_file = "cleaned_ukb_pheno.csv",
                          kinship_file = "ukb_rel.dat",
                          fuzziness = 0,
                          phenotype_name = "heart_attack",
                          phenotype_rank = c("yes", "no"),
                          fid_name = "ID1",
                          iid_name = "ID1",
                          fid1_name = "ID1",
                          fid2_name = 'ID2',
                          iid1_name = "ID1",
                          iid2_name = 'ID2',
                          kinship_name = "Kinship",
                          phenotypic_naive = FALSE)

heart_attack_naive = kdps(phenotype_file = "cleaned_ukb_pheno.csv",
                          kinship_file = "ukb_rel.dat",
                          fuzziness = 0,
                          phenotype_name = "heart_attack",
                          phenotype_rank = c("yes", "no"),
                          fid_name = "ID1",
                          iid_name = "ID1",
                          fid1_name = "ID1",
                          fid2_name = 'ID2',
                          iid1_name = "ID1",
                          iid2_name = 'ID2',
                          kinship_name = "Kinship",
                          phenotypic_naive = TRUE)

fwrite(heart_attack_aware, file = "heart_attack_aware.csv")
fwrite(heart_attack_naive, file = "heart_attack_naive.csv")
