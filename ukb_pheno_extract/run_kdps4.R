library(dplyr)
library(data.table)
library(kdps)

schizo_aware = kdps(phenotype_file = "cleaned_ukb_pheno.csv",
                    kinship_file = "ukb_rel.dat",
                    fuzziness = 0,
                    phenotype_name = "schizo",
                    phenotype_rank = c("yes", "no"),
                    fid_name = "ID1",
                    iid_name = "ID1",
                    fid1_name = "ID1",
                    fid2_name = 'ID2',
                    iid1_name = "ID1",
                    iid2_name = 'ID2',
                    kinship_name = "Kinship",
                    phenotypic_naive = FALSE)

schizo_naive = kdps(phenotype_file = "cleaned_ukb_pheno.csv",
                    kinship_file = "ukb_rel.dat",
                    fuzziness = 0,
                    phenotype_name = "schizo",
                    phenotype_rank = c("yes", "no"),
                    fid_name = "ID1",
                    iid_name = "ID1",
                    fid1_name = "ID1",
                    fid2_name = 'ID2',
                    iid1_name = "ID1",
                    iid2_name = 'ID2',
                    kinship_name = "Kinship",
                    phenotypic_naive = TRUE)

fwrite(schizo_aware, file = "schizo_aware.csv")
fwrite(schizo_naive, file = "schizo_naive.csv")

