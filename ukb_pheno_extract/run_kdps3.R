library(dplyr)
library(data.table)
library(kdps)

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

fwrite(ms_naive, file = "ms_naive.csv")
fwrite(ms_aware, file = "ms_aware.csv")

