library(dplyr)
library(tidyr)
library(data.table)
library(tibble)
library(progress)

phenotype_file = "data/pheno.txt"
kinship_file = "data/kinship.txt"
fuzziness = 0
phenotype_name = "pheno2"
prioritize_high = FALSE
prioritize_low = FALSE
phenotype_rank = c("DISEASED1", "DISEASED2", "HEALTHY")
# Header names in the phenotype file
fid_name = "FID"
iid_name = "IID"
# Header names in the kinship file
fid1_name = "FID1"
iid1_name = "IID1"
fid2_name = "FID2"
iid2_name = "IID2"
kinship_name = "KINSHIP"
kinship_threshold = 0.0442
phenotypic_naive = FALSE


### Make phenotype data frame
pheno = as.data.frame(fread(phenotype_file))
pheno[[phenotype_name]] = as.character(pheno[[phenotype_name]])
phenotype_rank = as.character(phenotype_rank)
if(!any(prioritize_high, prioritize_low)){
  phenotype = pheno[[phenotype_name]]
  mapping = setNames(length(phenotype_rank):1, phenotype_rank)
  wt = mapping[phenotype]
  names(wt) = NULL
  wt[is.na(wt)] = 0
}else{
  if(prioritize_high){
    phenotype = as.numeric(pheno[[phenotype_name]])
    na_wt = min(phenotype, na.rm = TRUE) - 1
    wt = ifelse(is.na(phenotype), na_wt, phenotype)
    wt = order(wt)
  }
  if(prioritize_low){
    phenotype = as.numeric(pheno[[phenotype_name]])
    na_wt = max(phenotype, na.rm = TRUE) + 1
    wt = ifelse(is.na(phenotype), na_wt, phenotype)
    wt = order(wt, decreasing = TRUE)
  }
}

fid_iid = paste0("subject_", paste(pheno[[fid_name]], 
                                   pheno[[iid_name]], 
                                   sep = "_"))

pheno = tibble(
  fid_iid = fid_iid,
  wt = wt
)

### Make kinship data frame
kinship = as.data.frame(fread(kinship_file))
kinship = tibble(
  fid1 = kinship[[fid1_name]],
  iid1 = kinship[[iid1_name]],
  fid2 = kinship[[fid2_name]],
  iid2 = kinship[[iid2_name]],
  kinship = kinship[[kinship_name]]
) 

kinship = kinship %>%
  mutate(fid1_iid1 = paste(fid1, iid1, sep = "_")) %>%
  mutate(fid2_iid2 = paste(fid2, iid2, sep = "_")) %>%
  mutate(fid1_iid1 = paste0("subject_", fid1_iid1)) %>%
  mutate(fid2_iid2 = paste0("subject_", fid2_iid2)) %>%
  mutate(related = kinship >= kinship_threshold) %>%
  filter(related) %>%
  select(fid1_iid1, fid2_iid2, related)

kinship_subjects = unique(c(kinship[["fid1_iid1"]], kinship[["fid2_iid2"]]))
pheno_subjects = unique(pheno[["fid_iid"]])
common_subjects = intersect(kinship_subjects, pheno_subjects)

cat(paste0(length(kinship_subjects), " unique subjects found in the kinship file...\n"))
cat(paste0(length(pheno_subjects), " unique subjects found in the phenotype file...\n"))
cat(paste0(length(common_subjects), " subjects are found in both the kinship and phenotype files...\n"))

kinship_standout = kinship_subjects[!(kinship_subjects %in% common_subjects)]
pheno_standout = pheno_subjects[!(pheno_subjects %in% common_subjects)]

cat(paste0(length(kinship_standout), " subjects removed because they are found only in the kinship file...\n"))
cat(paste0(length(pheno_standout), " subjects removed because they are found only in the phenotype file...\n"))

subject_to_remove = c(kinship_standout, pheno_standout)
