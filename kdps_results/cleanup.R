library(dplyr)

fl = file.path("kdps_result", list.files(path = "kdps_result", pattern = "pheno1"))

results_list = vector()
for(f in fl){
  load(f)
  kdps_result = kinclean_result
  
  results = tibble(
    n_relationship = kdps_result$n_relationship,
    seed = kdps_result$seed,
    fuzziness = kdps_result$fuzziness,
    phenotype_name = kdps_result$phenotype_name,
    prioritize = ifelse(kdps_result$prioritize_high, "high", "low"),
    runtime = kdps_result$runtime,
    total_n = kdps_result$total_n,
    n_remove = kdps_result$n_remove,
    plink_naive = kdps_result$plink_naive,
    # original_mean = kdps_result$phenotype_summary$original_set[4],
    # unrelated_mean = unlist(strsplit(kdps_result$phenotype_summary$unrelated_set[4], split = "[:]"))[2] %>%
    #   as.numeric()
  )
  results_list = rbind.data.frame(results_list, results)
  
}

head(results_list)


