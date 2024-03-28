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

ms_naive = kdps(phenotype_file = "cleaned_ukb_pheno.csv",
                kinship_file = "ukb_rel.dat",
                fuzziness = 0,
                phenotype_name = "ms",
                phenotype_rank = c("yes", "no"),
                fid_name = "ID1",
                iid_name = "ID1",
                fid1_name = "ID1",
                fid2_name = 'ID2',
                iid1_name = "ID1",
                iid2_name = 'ID2',
                kinship_name = "Kinship",
                phenotypic_naive = TRUE)

start_time = Sys.time()
ms_aware = kdps(phenotype_file = "cleaned_ukb_pheno.csv",
                kinship_file = "ukb_rel.dat",
                fuzziness = 0,
                phenotype_name = "ms",
                phenotype_rank = c("yes", "no"),
                fid_name = "ID1",
                iid_name = "ID1",
                fid1_name = "ID1",
                fid2_name = 'ID2',
                iid1_name = "ID1",
                iid2_name = 'ID2',
                kinship_name = "Kinship",
                phenotypic_naive = FALSE)
end_time = Sys.time()
runtime = end_time - start_time
cat(paste0("Total runtime: ", round(runtime, 3), " seconds.\n"))

