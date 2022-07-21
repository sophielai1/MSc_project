library(tidyverse)

setwd("/rds/general/user/syl416/home/MScProject/Hebei")

dataset_province <- readRDS("dataset_hebei.rds")

set.seed(1)
dataset_sample_1000 <- dataset_province[sample(nrow(dataset_province), 1000, replace=FALSE),]

saveRDS(dataset_sample_1000, file="dataset_hebei_sample_1000.rds")


