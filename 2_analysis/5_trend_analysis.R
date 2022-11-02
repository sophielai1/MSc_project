library(openair)
library(tidyverse)


# province smoothtrend ----------------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/Aggregated_data/province_level")
all_provinces_daily <- readRDS("all_provinces_daily.rds")

head(all_provinces_daily)

y_expression <- expression(PM[2.5] ~ (ug/m^3))
setwd("/rds/general/user/syl416/home/MSc_project/3_results")
pdf("5_province_level_smoothTrend_monthly.pdf", width=11)
set.seed(1)
smoothTrend(mydata=all_provinces_daily,
            avg.time="month",
            pollutant=c("Hebei",
                        "Liaoning",
                        "Ningxia",
                        "Shanxi",
                        "Shaanxi"),
            main=paste("Monthly Mean PM2.5 Concentration Trends"),
            ylab=y_expression,
            #ref.y = list(h = 75, lty = 5),
            deseason=FALSE)
dev.off()

y_expression <- expression(PM[2.5] ~ (ug/m^3))
setwd("/rds/general/user/syl416/home/MSc_project/3_results")
pdf("5_province_level_smoothTrend_monthly_deseasoned.pdf", width=11)
set.seed(1)
smoothTrend(mydata=all_provinces_daily,
            avg.time="month",
            pollutant=c("Hebei",
                        "Liaoning",
                        "Ningxia",
                        "Shanxi",
                        "Shaanxi"),
            main=paste("Monthly Mean Deseasoned PM2.5 Concentration Trends"),
            ylab=y_expression,
            #ref.y = list(h = 75, lty = 5),
            deseason=TRUE)
dev.off()



# province TheilSen -------------------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/Aggregated_data/province_level")
all_provinces_daily <- readRDS("all_provinces_daily.rds")

head(all_provinces_daily)

#plots for hebei only
#hebei
y_expression <- expression(PM[2.5] ~ (ug/m^3))
setwd("/rds/general/user/syl416/home/MSc_project/3_results")
pdf("5_province_level_TheilSen_monthly_hebei_deseasoned.pdf", width=11)
set.seed(1)
TheilSen(mydata=all_provinces_daily,
         pollutant="Hebei",
         main=paste("Hebei Monthly Deseasoned TheilSen Plot"),
         deseason=TRUE, avg.time="month",
         ylab=y_expression)
dev.off()

pdf("5_province_level_TheilSen_monthly_hebei.pdf", width=11)
set.seed(1)
TheilSen(mydata=all_provinces_daily,
         pollutant="Hebei",
         main=paste("Hebei Monthly TheilSen Plot"),
         deseason=FALSE, avg.time="month",
         ylab=y_expression)
dev.off()

#Theil Sen estimates for all provinces
province_TheilSen <- TheilSen(mydata=all_provinces_daily,
                              pollutant="Hebei",
                              deseason=FALSE, avg.time="month")
province_TheilSen$data[[2]]

province_TheilSen <- TheilSen(mydata=all_provinces_daily,
                              pollutant="Liaoning",
                              deseason=FALSE, avg.time="month")
province_TheilSen$data[[2]]

province_TheilSen <- TheilSen(mydata=all_provinces_daily,
                              pollutant="Ningxia",
                              deseason=FALSE, avg.time="month")
province_TheilSen$data[[2]]

province_TheilSen <- TheilSen(mydata=all_provinces_daily,
                              pollutant="Shanxi",
                              deseason=FALSE, avg.time="month")
province_TheilSen$data[[2]]

province_TheilSen <- TheilSen(mydata=all_provinces_daily,
                              pollutant="Shaanxi",
                              deseason=FALSE, avg.time="month")
province_TheilSen$data[[2]]

#Theil Sen estimates for all provinces - deseasoned
province_TheilSen <- TheilSen(mydata=all_provinces_daily,
                              pollutant="Hebei",
                              deseason=TRUE, avg.time="month")
province_TheilSen$data[[2]]

province_TheilSen <- TheilSen(mydata=all_provinces_daily,
                              pollutant="Liaoning",
                              deseason=TRUE, avg.time="month")
province_TheilSen$data[[2]]

province_TheilSen <- TheilSen(mydata=all_provinces_daily,
                              pollutant="Ningxia",
                              deseason=TRUE, avg.time="month")
province_TheilSen$data[[2]]

province_TheilSen <- TheilSen(mydata=all_provinces_daily,
                              pollutant="Shanxi",
                              deseason=TRUE, avg.time="month")
province_TheilSen$data[[2]]

province_TheilSen <- TheilSen(mydata=all_provinces_daily,
                              pollutant="Shaanxi",
                              deseason=TRUE, avg.time="month")
province_TheilSen$data[[2]]



# exploring with other plots ----------------------------------------------
# province timeVariation --------------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/Aggregated_data/province_level")
all_provinces_daily <- readRDS("all_provinces_daily.rds")

head(all_provinces_daily)

#timesplit dataset
liaoning_subset <- all_provinces_daily[, c(1,2)]
head(liaoning_subset)
liaoning_date_split <- splitByDate(mydata=liaoning_subset,
                                   dates="1/1/2017",
                                   labels=c("Before Coal-to-Electricity Policy",
                                            "After Coal-to-Electricity Policy"))

y_expression <- expression(PM[2.5] ~ (ug/m^3))

set.seed(1)
timeVar_liaoning <- timeVariation(mydata=liaoning_date_split,
                                  pollutant=c("Liaoning"),
                                  group="split.by",
                                  main=paste("Liaoning PM2.5 Before and After Coal-to-Electricity Policy by Month"),
                                  ylab=y_expression,
                                  ref.y = list(h = 75, lty = 5))
#pdf("timeVariation_daily_liaoning_before_after.pdf", width=9)
plot(timeVar_liaoning, subset="month")
#dev.off()


















