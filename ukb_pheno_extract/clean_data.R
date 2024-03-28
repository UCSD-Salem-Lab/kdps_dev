library(kdps)
library(dplyr)
library(data.table)

pheno = fread("ukbb_phenotype.txt")
table(pheno$alcohol_drinking.0.0)

table(is.na(pheno$alcohol_drinking.0.0))

pheno = pheno %>%
  mutate(schizo = ifelse(!is.na(schizophrenia.0.0), "yes", "no")) %>%
  mutate(heart_attack = ifelse(!is.na(heart_attack.0.0), "yes", "no")) %>%
  mutate(ms = ifelse(!is.na(ms.0.0), "yes", "no")) %>%
  mutate(alcohol_drinking = alcohol_drinking.0.0) %>%
  select(f.eid, sex.0.0, age.0.0, schizo, heart_attack, ms, alcohol_drinking) %>%
  na.omit() %>%
  mutate(alcohol_drinking = ifelse(alcohol_drinking == "", "Missing", alcohol_drinking))

names(pheno) = c("ID1", "sex", "age", "schizo", "heart_attack", "ms", "alcohol_drinking")

# Write data
fwrite(pheno, file = "cleaned_ukb_pheno.csv", sep = ",")
  




