library(dplyr)
library(data.table)

pheno = fread("cleaned_ukb_pheno.csv")
names(pheno)[1] = "IID"

ms_a = fread("ms_aware.csv") %>%
  inner_join(pheno, by = "IID") %>%
  select(IID, ms)
ms_n = fread("ms_naive.csv") %>%
  inner_join(pheno, by = "IID") %>%
  select(IID, ms)

ha_a = fread("heart_attack_aware.csv") %>%
  inner_join(pheno, by = "IID") %>%
  select(IID, heart_attack)
ha_n = fread("heart_attack_naive.csv") %>%
  inner_join(pheno, by = "IID") %>%
  select(IID, heart_attack)

schizo_a = fread("schizo_aware.csv") %>%
  inner_join(pheno, by = "IID") %>%
  select(IID, schizo)
schizo_n = fread("schizo_naive.csv") %>%
  inner_join(pheno, by = "IID") %>%
  select(IID, schizo)

ad_a = fread("alcohol_drinking_aware.csv") %>%
  inner_join(pheno, by = "IID") %>%
  select(IID, alcohol_drinking)
ad_n = fread("alcohol_drinking_naive.csv") %>%
  inner_join(pheno, by = "IID") %>%
  select(IID, alcohol_drinking)

table(ad_a$alcohol_drinking)
table(ad_n$alcohol_drinking)

table(schizo_a$schizo)
table(schizo_n$schizo)

table(ha_a$heart_attack)
table(ha_n$heart_attack)

table(ms_a$ms)
table(ms_n$ms)

