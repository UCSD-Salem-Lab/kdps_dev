library(dplyr)
library(data.table)
library(kdps)

alcohol_drinking_aware = kdps(phenotype_file = "cleaned_ukb_pheno.csv",
                              kinship_file = "ukb_rel.dat",
                              fuzziness = 0,
                              phenotype_name = "alcohol_drinking",
                              phenotype_rank = c("Never", "Previous", "Current", 
                                                 "Prefer not to answer", "Missing"),
                              fid_name = "ID1",
                              iid_name = "ID1",
                              fid1_name = "ID1",
                              fid2_name = 'ID2',
                              iid1_name = "ID1",
                              iid2_name = 'ID2',
                              kinship_name = "Kinship",
                              phenotypic_naive = FALSE)

alcohol_drinking_naive = kdps(phenotype_file = "cleaned_ukb_pheno.csv",
                              kinship_file = "ukb_rel.dat",
                              fuzziness = 0,
                              phenotype_name = "alcohol_drinking",
                              phenotype_rank = c("Never", "Previous", "Current", 
                                                 "Prefer not to answer", "Missing"),
                              fid_name = "ID1",
                              iid_name = "ID1",
                              fid1_name = "ID1",
                              fid2_name = 'ID2',
                              iid1_name = "ID1",
                              iid2_name = 'ID2',
                              kinship_name = "Kinship",
                              phenotypic_naive = TRUE)

fwrite(alcohol_drinking_aware, file = "alcohol_drinking_aware.csv")
fwrite(alcohol_drinking_naive, file = "alcohol_drinking_naive.csv")
