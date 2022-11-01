library(tidyverse)
setwd("/rds/general/user/syl416/home/MSc_project/Original_data")


# Hebei: combine tiles ----------------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/Original_data/Hebei_tiles")
hebei_tiles <- list.files(pattern="*.csv") %>%
  lapply(read_csv) %>%
  bind_rows
saveRDS(hebei_tiles, file="hebei_tiles.rds")

# Hebei: subset data 2015-16 ----------------------------------------------
#get province data from year dataset
setwd("/rds/general/user/syl416/home/MSc_project/Original_data")
data_2015_16 <- readRDS("3_final_data_2015_16.rds")
hebei_2015_16 <- data_2015_16[data_2015_16$GridID %in% unique(hebei_tiles$GridID), ]

#print test statements to check dataset sizes
print("table(table(unique(hebei_tiles$GridID)))")
print(table(table(unique(hebei_tiles$GridID))))
print("")

print("dim(data_2015_16)")
print(dim(data_2015_16))
print("")

print("dim(hebei_2015_16)")
print(dim(hebei_2015_16))
print("")

print(head(hebei_2015_16))

#save as rds
saveRDS(hebei_2015_16, "4_hebei_2015_16.rds")

# Hebei: subset data 2017-18 ----------------------------------------------
#get province data from year dataset
data_2017_18 <- readRDS("3_final_data_2017_18.rds")
hebei_2017_18 <- data_2017_18[data_2017_18$GridID %in% unique(hebei_tiles$GridID), ]

#print test statements to check dataset sizes
print("table(table(unique(hebei_tiles$GridID)))")
print(table(table(unique(hebei_tiles$GridID))))
print("")

print("dim(data_2017_18)")
print(dim(data_2017_18))
print("")

print("dim(hebei_2017_18)")
print(dim(hebei_2017_18))
print("")

print(head(hebei_2017_18))

#save as rds
saveRDS(hebei_2017_18, "4_hebei_2017_18.rds")

# Hebei: subset data 2019-20 ----------------------------------------------
#get province data from year dataset
data_2019_20 <- readRDS("3_final_data_2019_20.rds")
hebei_2019_20 <- data_2019_20[data_2019_20$GridID %in% unique(hebei_tiles$GridID), ]

#print test statements to check dataset sizes
print("table(table(unique(hebei_tiles$GridID)))")
print(table(table(unique(hebei_tiles$GridID))))
print("")

print("dim(data_2019_20)")
print(dim(data_2019_20))
print("")

print("dim(hebei_2019_20)")
print(dim(hebei_2019_20))
print("")

print(head(hebei_2019_20))

#save as rds
saveRDS(hebei_2019_20, "4_hebei_2019_20.rds")


# Hebei: combine datasets --------------------------------------------
hebei_rdsfiles <-
  c("4_hebei_2015_16.rds",
    "4_hebei_2017_18.rds",
    "4_hebei_2019_20.rds")

hebei_data_combined <- hebei_rdsfiles %>%
  map_dfr(readRDS)

print("hebei data combined dimensions:")
print(dim(hebei_data_combined))
print("")

print("head")
print(head(hebei_data_combined))

saveRDS(hebei_data_combined, "4_hebei_full_dataset.rds")


# Hebei: create sample dataset --------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/1_data_preprocessing/4_sample_province_datasets")
set.seed(1)
hebei_sample_1000 <- hebei_data_combined[sample(nrow(hebei_data_combined), 1000, replace=FALSE),]

saveRDS(hebei_sample_1000, file="4_hebei_sample_dataset.rds")




# Liaoning: combine tiles ----------------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/Original_data/Liaoning_tiles")
liaoning_tiles <- list.files(pattern="*.csv") %>%
  lapply(read_csv) %>%
  bind_rows
saveRDS(liaoning_tiles, file="liaoning_tiles.rds")

# Liaoning: subset data 2015-16 ----------------------------------------------
#get province data from year dataset
setwd("/rds/general/user/syl416/home/MSc_project/Original_data")
liaoning_2015_16 <- data_2015_16[data_2015_16$GridID %in% unique(liaoning_tiles$GridID), ]

#print test statements to check dataset sizes
print("table(table(unique(liaoning_tiles$GridID)))")
print(table(table(unique(liaoning_tiles$GridID))))
print("")

print("dim(data_2015_16)")
print(dim(data_2015_16))
print("")

print("dim(liaoning_2015_16)")
print(dim(liaoning_2015_16))
print("")

print(head(liaoning_2015_16))

#save as rds
saveRDS(liaoning_2015_16, "4_liaoning_2015_16.rds")

# Liaoning: subset data 2017-18 ----------------------------------------------
#get province data from year dataset
liaoning_2017_18 <- data_2017_18[data_2017_18$GridID %in% unique(liaoning_tiles$GridID), ]

#print test statements to check dataset sizes
print("table(table(unique(liaoning_tiles$GridID)))")
print(table(table(unique(liaoning_tiles$GridID))))
print("")

print("dim(data_2017_18)")
print(dim(data_2017_18))
print("")

print("dim(liaoning_2017_18)")
print(dim(liaoning_2017_18))
print("")

print(head(liaoning_2017_18))

#save as rds
saveRDS(liaoning_2017_18, "4_liaoning_2017_18.rds")

# Liaoning: subset data 2019-20 ----------------------------------------------
#get province data from year dataset
liaoning_2019_20 <- data_2019_20[data_2019_20$GridID %in% unique(liaoning_tiles$GridID), ]

#print test statements to check dataset sizes
print("table(table(unique(liaoning_tiles$GridID)))")
print(table(table(unique(liaoning_tiles$GridID))))
print("")

print("dim(data_2019_20)")
print(dim(data_2019_20))
print("")

print("dim(liaoning_2019_20)")
print(dim(liaoning_2019_20))
print("")

print(head(liaoning_2019_20))

#save as rds
saveRDS(liaoning_2019_20, "4_liaoning_2019_20.rds")


# Liaoning: combine datasets --------------------------------------------
liaoning_rdsfiles <-
  c("4_liaoning_2015_16.rds",
    "4_liaoning_2017_18.rds",
    "4_liaoning_2019_20.rds")

liaoning_data_combined <- liaoning_rdsfiles %>%
  map_dfr(readRDS)

print("liaoning data combined dimensions:")
print(dim(liaoning_data_combined))
print("")

print("head")
print(head(liaoning_data_combined))

saveRDS(liaoning_data_combined, "4_liaoning_full_dataset.rds")


# Liaoning: create sample dataset --------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/1_data_preprocessing/4_sample_province_datasets")
set.seed(1)
liaoning_sample_1000 <- liaoning_data_combined[sample(nrow(liaoning_data_combined), 1000, replace=FALSE),]

saveRDS(liaoning_sample_1000, file="4_liaoning_sample_dataset.rds")





# Ningxia: combine tiles ----------------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/Original_data/Ningxia_tiles")
ningxia_tiles <- list.files(pattern="*.csv") %>%
  lapply(read_csv) %>%
  bind_rows
saveRDS(ningxia_tiles, file="ningxia_tiles.rds")

# Ningxia: subset data 2015-16 ----------------------------------------------
#get province data from year dataset
setwd("/rds/general/user/syl416/home/MSc_project/Original_data")
ningxia_2015_16 <- data_2015_16[data_2015_16$GridID %in% unique(ningxia_tiles$GridID), ]

#print test statements to check dataset sizes
print("table(table(unique(ningxia_tiles$GridID)))")
print(table(table(unique(ningxia_tiles$GridID))))
print("")

print("dim(data_2015_16)")
print(dim(data_2015_16))
print("")

print("dim(ningxia_2015_16)")
print(dim(ningxia_2015_16))
print("")

print(head(ningxia_2015_16))

#save as rds
saveRDS(ningxia_2015_16, "4_ningxia_2015_16.rds")

# Ningxia: subset data 2017-18 ----------------------------------------------
#get province data from year dataset
ningxia_2017_18 <- data_2017_18[data_2017_18$GridID %in% unique(ningxia_tiles$GridID), ]

#print test statements to check dataset sizes
print("table(table(unique(ningxia_tiles$GridID)))")
print(table(table(unique(ningxia_tiles$GridID))))
print("")

print("dim(data_2017_18)")
print(dim(data_2017_18))
print("")

print("dim(ningxia_2017_18)")
print(dim(ningxia_2017_18))
print("")

print(head(ningxia_2017_18))

#save as rds
saveRDS(ningxia_2017_18, "4_ningxia_2017_18.rds")

# Ningxia: subset data 2019-20 ----------------------------------------------
#get province data from year dataset
ningxia_2019_20 <- data_2019_20[data_2019_20$GridID %in% unique(ningxia_tiles$GridID), ]

#print test statements to check dataset sizes
print("table(table(unique(ningxia_tiles$GridID)))")
print(table(table(unique(ningxia_tiles$GridID))))
print("")

print("dim(data_2019_20)")
print(dim(data_2019_20))
print("")

print("dim(ningxia_2019_20)")
print(dim(ningxia_2019_20))
print("")

print(head(ningxia_2019_20))

#save as rds
saveRDS(ningxia_2019_20, "4_ningxia_2019_20.rds")


# Ningxia: combine datasets --------------------------------------------
ningxia_rdsfiles <-
  c("4_ningxia_2015_16.rds",
    "4_ningxia_2017_18.rds",
    "4_ningxia_2019_20.rds")

ningxia_data_combined <- ningxia_rdsfiles %>%
  map_dfr(readRDS)

print("ningxia data combined dimensions:")
print(dim(ningxia_data_combined))
print("")

print("head")
print(head(ningxia_data_combined))

saveRDS(ningxia_data_combined, "4_ningxia_full_dataset.rds")


# Ningxia: create sample dataset --------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/1_data_preprocessing/4_sample_province_datasets")
set.seed(1)
ningxia_sample_1000 <- ningxia_data_combined[sample(nrow(ningxia_data_combined), 1000, replace=FALSE),]

saveRDS(ningxia_sample_1000, file="4_ningxia_sample_dataset.rds")




# Shanxi: combine tiles ----------------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/Original_data/Shanxi_tiles")
shanxi_tiles <- list.files(pattern="*.csv") %>%
  lapply(read_csv) %>%
  bind_rows
saveRDS(shanxi_tiles, file="shanxi_tiles.rds")

# Shanxi: subset data 2015-16 ----------------------------------------------
#get province data from year dataset
setwd("/rds/general/user/syl416/home/MSc_project/Original_data")
shanxi_2015_16 <- data_2015_16[data_2015_16$GridID %in% unique(shanxi_tiles$GridID), ]

#print test statements to check dataset sizes
print("table(table(unique(shanxi_tiles$GridID)))")
print(table(table(unique(shanxi_tiles$GridID))))
print("")

print("dim(data_2015_16)")
print(dim(data_2015_16))
print("")

print("dim(shanxi_2015_16)")
print(dim(shanxi_2015_16))
print("")

print(head(shanxi_2015_16))

#save as rds
saveRDS(shanxi_2015_16, "4_shanxi_2015_16.rds")

# Shanxi: subset data 2017-18 ----------------------------------------------
#get province data from year dataset
shanxi_2017_18 <- data_2017_18[data_2017_18$GridID %in% unique(shanxi_tiles$GridID), ]

#print test statements to check dataset sizes
print("table(table(unique(shanxi_tiles$GridID)))")
print(table(table(unique(shanxi_tiles$GridID))))
print("")

print("dim(data_2017_18)")
print(dim(data_2017_18))
print("")

print("dim(shanxi_2017_18)")
print(dim(shanxi_2017_18))
print("")

print(head(shanxi_2017_18))

#save as rds
saveRDS(shanxi_2017_18, "4_shanxi_2017_18.rds")

# Shanxi: subset data 2019-20 ----------------------------------------------
#get province data from year dataset
shanxi_2019_20 <- data_2019_20[data_2019_20$GridID %in% unique(shanxi_tiles$GridID), ]

#print test statements to check dataset sizes
print("table(table(unique(shanxi_tiles$GridID)))")
print(table(table(unique(shanxi_tiles$GridID))))
print("")

print("dim(data_2019_20)")
print(dim(data_2019_20))
print("")

print("dim(shanxi_2019_20)")
print(dim(shanxi_2019_20))
print("")

print(head(shanxi_2019_20))

#save as rds
saveRDS(shanxi_2019_20, "4_shanxi_2019_20.rds")


# Shanxi: combine datasets --------------------------------------------
shanxi_rdsfiles <-
  c("4_shanxi_2015_16.rds",
    "4_shanxi_2017_18.rds",
    "4_shanxi_2019_20.rds")

shanxi_data_combined <- shanxi_rdsfiles %>%
  map_dfr(readRDS)

print("shanxi data combined dimensions:")
print(dim(shanxi_data_combined))
print("")

print("head")
print(head(shanxi_data_combined))

saveRDS(shanxi_data_combined, "4_shanxi_full_dataset.rds")


# Shanxi: create sample dataset --------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/1_data_preprocessing/4_sample_province_datasets")
set.seed(1)
shanxi_sample_1000 <- shanxi_data_combined[sample(nrow(shanxi_data_combined), 1000, replace=FALSE),]

saveRDS(shanxi_sample_1000, file="4_shanxi_sample_dataset.rds")




# Shaanxi: combine tiles ----------------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/Original_data/Shaanxi_tiles")
shaanxi_tiles <- list.files(pattern="*.csv") %>%
  lapply(read_csv) %>%
  bind_rows
saveRDS(shaanxi_tiles, file="shaanxi_tiles.rds")

# Shaanxi: subset data 2015-16 ----------------------------------------------
#get province data from year dataset
setwd("/rds/general/user/syl416/home/MSc_project/Original_data")
shaanxi_2015_16 <- data_2015_16[data_2015_16$GridID %in% unique(shaanxi_tiles$GridID), ]

#print test statements to check dataset sizes
print("table(table(unique(shaanxi_tiles$GridID)))")
print(table(table(unique(shaanxi_tiles$GridID))))
print("")

print("dim(data_2015_16)")
print(dim(data_2015_16))
print("")

print("dim(shaanxi_2015_16)")
print(dim(shaanxi_2015_16))
print("")

print(head(shaanxi_2015_16))

#save as rds
saveRDS(shaanxi_2015_16, "4_shaanxi_2015_16.rds")

# Shaanxi: subset data 2017-18 ----------------------------------------------
#get province data from year dataset
shaanxi_2017_18 <- data_2017_18[data_2017_18$GridID %in% unique(shaanxi_tiles$GridID), ]

#print test statements to check dataset sizes
print("table(table(unique(shaanxi_tiles$GridID)))")
print(table(table(unique(shaanxi_tiles$GridID))))
print("")

print("dim(data_2017_18)")
print(dim(data_2017_18))
print("")

print("dim(shaanxi_2017_18)")
print(dim(shaanxi_2017_18))
print("")

print(head(shaanxi_2017_18))

#save as rds
saveRDS(shaanxi_2017_18, "4_shaanxi_2017_18.rds")

# Shaanxi: subset data 2019-20 ----------------------------------------------
#get province data from year dataset
shaanxi_2019_20 <- data_2019_20[data_2019_20$GridID %in% unique(shaanxi_tiles$GridID), ]

#print test statements to check dataset sizes
print("table(table(unique(shaanxi_tiles$GridID)))")
print(table(table(unique(shaanxi_tiles$GridID))))
print("")

print("dim(data_2019_20)")
print(dim(data_2019_20))
print("")

print("dim(shaanxi_2019_20)")
print(dim(shaanxi_2019_20))
print("")

print(head(shaanxi_2019_20))

#save as rds
saveRDS(shaanxi_2019_20, "4_shaanxi_2019_20.rds")


# Shaanxi: combine datasets --------------------------------------------
shanxi_rdsfiles <-
  c("4_shaanxi_2015_16.rds",
    "4_shaanxi_2017_18.rds",
    "4_shaanxi_2019_20.rds")

shaanxi_data_combined <- shaanxi_rdsfiles %>%
  map_dfr(readRDS)

print("shaanxi data combined dimensions:")
print(dim(shaanxi_data_combined))
print("")

print("head")
print(head(shaanxi_data_combined))

saveRDS(shaanxi_data_combined, "4_shaanxi_full_dataset.rds")


# Shaanxi: create sample dataset --------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/1_data_preprocessing/4_sample_province_datasets")
set.seed(1)
shaanxi_sample_1000 <- shaanxi_data_combined[sample(nrow(shaanxi_data_combined), 1000, replace=FALSE),]

saveRDS(shaanxi_sample_1000, file="4_shaanxi_sample_dataset.rds")




