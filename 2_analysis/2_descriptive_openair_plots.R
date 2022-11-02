library(openair)
library(tidyverse)


# province timeplot -------------------------------------------------------
#timePlot plot
setwd("/rds/general/user/syl416/home/MSc_project/Aggregated_data/province_level")
all_provinces_weekly <- readRDS("all_provinces_weekly.rds")

y_expression <- expression(PM[2.5] ~ (ug/m^3))
setwd("/rds/general/user/syl416/home/MSc_project/3_results")
pdf("2_province_level_timePlot_weekly.pdf", width=11)
timePlot(mydata=all_provinces_weekly, 
         pollutant=c("Hebei", 
                     "Liaoning",
                     "Ningxia",
                     "Shanxi",
                     "Shaanxi"), 
         main=paste("Weekly PM2.5 Concentrations for All Provinces"),
         ref.x=list(v = as.POSIXct("2017-01-01"), lty = 1),
         #y.relation="free",
         ylab=y_expression,
         ref.y = list(h = 75, lty = 5),
         group=FALSE, lty=1)
dev.off()




# county timeplot ---------------------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/Aggregated_data/county_level")
all_counties_week <- readRDS("all_counties_weekly.rds")

head(all_counties_week)

#MAKE THE 2 COUNTIES FROM SAME PROVINCE SAME COLOUR
#timeplot
y_expression <- expression(PM[2.5] ~ (ug/m^3))
setwd("/rds/general/user/syl416/home/MSc_project/3_results")
pdf("2_county_level_timePlot_weekly.pdf", width=16, height=13)
timePlot(mydata=all_counties_week,
         pollutant=c("Anguo",
                     "Luquan",
                     "Fengcheng",
                     "Zhangwu",
                     "Pingluo",
                     "Qingtongxia",
                     "Changzhi",
                     "Gaoping",
                     "Chenggu",
                     "Qishan"),
         main=paste("Weekly PM2.5 Concentrations for All Counties"),
         ref.x=list(v = as.POSIXct("2017-01-01"), lty = 1),
         #y.relation="free",
         y.relation="same",
         ylab=y_expression,
         ref.y = list(h = 75, lty = 5),
         cols=c("#E41A1C","#E41A1C",
                "#377EB8", "#377EB8",
                "#4DAF4A", "#4DAF4A",
                "#984EA3", "#984EA3",
                "#FF7F00", "#FF7F00"),
         key.columns=5,
         par.settings=list(fontsize=list(text=16))
)
dev.off()



















# county smoothtrend ------------------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial")
all_counties_daily <- readRDS("all_counties_daily.rds")

head(all_counties_daily)
#smoothTrend plot
y_expression <- expression(PM[2.5] ~ (ug/m^3))
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/plots")
pdf("smoothTrend_monthly_all_counties_deseasoned_norefline.pdf", width=11)
smoothTrend(mydata=all_counties_daily,
            avg.time="month",
            pollutant=c("Anguo",
                        "Luquan",
                        "Fengcheng",
                        "Zhangwu",
                        "Pingluo",
                        "Qingtongxia",
                        "Changzhi",
                        "Gaoping",
                        "Chenggu",
                        "Qishan"),
            main=paste("Deseasoned Monthly PM2.5 Concentration Trends"),
            ylab=y_expression,
            #ref.y = list(h = 75, lty = 5),
            #deseason=FALSE,
            deseason=TRUE,
            key.columns=5)
dev.off()

y_expression <- expression(PM[2.5] ~ (ug/m^3))
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/plots")
pdf("smoothTrend_monthly_all_counties_norefline.pdf", width=11)
smoothTrend(mydata=all_counties_daily,
            avg.time="month",
            pollutant=c("Anguo",
                        "Luquan",
                        "Fengcheng",
                        "Zhangwu",
                        "Pingluo",
                        "Qingtongxia",
                        "Changzhi",
                        "Gaoping",
                        "Chenggu",
                        "Qishan"),
            main=paste("Monthly PM2.5 Concentration Trends"),
            ylab=y_expression,
            #ref.y = list(h = 75, lty = 5),
            deseason=FALSE,
            key.columns=5)
dev.off()

#hebei
y_expression <- expression(PM[2.5] ~ (ug/m^3))
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/plots")
pdf("smoothTrend_monthly_hebei.pdf", width=11)
smoothTrend(mydata=all_counties_daily,
            avg.time="month",
            pollutant=c("Anguo",
                        "Luquan"),
            main=paste("Hebei Monthly PM2.5 Concentration Trends"),
            ylab=y_expression,
            ref.y = list(h = 75, lty = 5),
            deseason=FALSE,
            cols=c("#E41A1C","#1F83B4"))
dev.off()

y_expression <- expression(PM[2.5] ~ (ug/m^3))
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/plots")
pdf("smoothTrend_monthly_hebei_deseasoned.pdf", width=11)
smoothTrend(mydata=all_counties_daily,
            avg.time="month",
            pollutant=c("Anguo",
                        "Luquan"),
            main=paste("Hebei Deseasoned Monthly PM2.5 Concentration Trends"),
            ylab=y_expression,
            ref.y = list(h = 75, lty = 5),
            deseason=TRUE,
            cols=c("#E41A1C","#1F83B4"))
dev.off()

#liaoning
y_expression <- expression(PM[2.5] ~ (ug/m^3))
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/plots")
pdf("smoothTrend_monthly_liaoning.pdf", width=11)
smoothTrend(mydata=all_counties_daily,
            avg.time="month",
            pollutant=c("Fengcheng",
                        "Zhangwu"),
            main=paste("Liaoning Monthly PM2.5 Concentration Trends"),
            ylab=y_expression,
            ref.y = list(h = 75, lty = 5),
            deseason=FALSE,
            cols=c("#E41A1C","#1F83B4"))
dev.off()

y_expression <- expression(PM[2.5] ~ (ug/m^3))
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/plots")
pdf("smoothTrend_monthly_liaoning_deseasoned.pdf", width=11)
smoothTrend(mydata=all_counties_daily,
            avg.time="month",
            pollutant=c("Fengcheng",
                        "Zhangwu"),
            main=paste("Liaoning Deseasoned Monthly PM2.5 Concentration Trends"),
            ylab=y_expression,
            ref.y = list(h = 75, lty = 5),
            deseason=FALSE,
            cols=c("#E41A1C","#1F83B4"))
dev.off()

#ningxia
y_expression <- expression(PM[2.5] ~ (ug/m^3))
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/plots")
pdf("smoothTrend_monthly_ningxia.pdf", width=11)
smoothTrend(mydata=all_counties_daily,
            avg.time="month",
            pollutant=c("Pingluo",
                        "Qingtongxia"),
            main=paste("Ningxia Monthly PM2.5 Concentration Trends"),
            ylab=y_expression,
            ref.y = list(h = 75, lty = 5),
            deseason=FALSE,
            cols=c("#E41A1C","#1F83B4"))
dev.off()

y_expression <- expression(PM[2.5] ~ (ug/m^3))
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/plots")
pdf("smoothTrend_monthly_ningxia_deseasoned.pdf", width=11)
smoothTrend(mydata=all_counties_daily,
            avg.time="month",
            pollutant=c("Pingluo",
                        "Qingtongxia"),
            main=paste("Ningxia Deseasoned Monthly PM2.5 Concentration Trends"),
            ylab=y_expression,
            ref.y = list(h = 75, lty = 5),
            deseason=FALSE,
            cols=c("#E41A1C","#1F83B4"))
dev.off()

#shanxi
y_expression <- expression(PM[2.5] ~ (ug/m^3))
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/plots")
pdf("smoothTrend_monthly_shanxi.pdf", width=11)
smoothTrend(mydata=all_counties_daily,
            avg.time="month",
            pollutant=c("Changzhi",
                        "Gaoping"),
            main=paste("Shanxi Monthly PM2.5 Concentration Trends"),
            ylab=y_expression,
            ref.y = list(h = 75, lty = 5),
            deseason=FALSE,
            cols=c("#E41A1C","#1F83B4"))
dev.off()

y_expression <- expression(PM[2.5] ~ (ug/m^3))
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/plots")
pdf("smoothTrend_monthly_shanxi_deseasoned.pdf", width=11)
smoothTrend(mydata=all_counties_daily,
            avg.time="month",
            pollutant=c("Changzhi",
                        "Gaoping"),
            main=paste("Shanxi Deseasoned Monthly PM2.5 Concentration Trends"),
            ylab=y_expression,
            ref.y = list(h = 75, lty = 5),
            deseason=FALSE,
            cols=c("#E41A1C","#1F83B4"))
dev.off()

#shaanxi
y_expression <- expression(PM[2.5] ~ (ug/m^3))
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/plots")
pdf("smoothTrend_monthly_shaanxi.pdf", width=11)
smoothTrend(mydata=all_counties_daily,
            avg.time="month",
            pollutant=c("Chenggu",
                        "Qishan"),
            main=paste("Shaanxi Monthly PM2.5 Concentration Trends"),
            ylab=y_expression,
            ref.y = list(h = 75, lty = 5),
            deseason=FALSE,
            cols=c("#E41A1C","#1F83B4"))
dev.off()

y_expression <- expression(PM[2.5] ~ (ug/m^3))
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/plots")
pdf("smoothTrend_monthly_shaanxi_deseasoned.pdf", width=11)
smoothTrend(mydata=all_counties_daily,
            avg.time="month",
            pollutant=c("Chenggu",
                        "Qishan"),
            main=paste("Shaanxi Deseasoned Monthly PM2.5 Concentration Trends"),
            ylab=y_expression,
            ref.y = list(h = 75, lty = 5),
            deseason=FALSE,
            cols=c("#E41A1C","#1F83B4"))
dev.off()


# province smoothtrend ----------------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/province_level/partial")
all_provinces_daily <- readRDS("all_provinces_daily.rds")

head(all_provinces_daily)

y_expression <- expression(PM[2.5] ~ (ug/m^3))
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/province_level/partial/plots")
pdf("smoothTrend_monthly_all_provinces_norefline.pdf", width=11)
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
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/province_level/partial/plots")
pdf("smoothTrend_monthly_all_provinces_deseasoned_norefline.pdf", width=11)
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
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/province_level/partial")
all_provinces_daily <- readRDS("all_provinces_daily.rds")

head(all_provinces_daily)
#hebei
y_expression <- expression(PM[2.5] ~ (ug/m^3))
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/province_level/partial/plots")
pdf("TheilSen_monthly_hebei_deseason.pdf", width=11)
set.seed(1)
TheilSen(mydata=all_provinces_daily,
         pollutant="Hebei",
         main=paste("Hebei Monthly Deseasoned TheilSen Plot"),
         deseason=TRUE, avg.time="month",
         ylab=y_expression)
dev.off()

pdf("TheilSen_monthly_hebei.pdf", width=11)
set.seed(1)
TheilSen(mydata=all_provinces_daily,
         pollutant="Hebei",
         main=paste("Hebei Monthly TheilSen Plot"),
         deseason=FALSE, avg.time="month",
         ylab=y_expression)
dev.off()


# province TheilSen estimates ---------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/province_level/partial")
all_provinces_daily <- readRDS("all_provinces_daily.rds")
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


# county TheilSen -------------------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial")
all_counties_daily <- readRDS("all_counties_daily.rds")

head(all_counties_daily)
#hebei
y_expression <- expression(PM[2.5] ~ (ug/m^3))
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/plots")
pdf("TheilSen_monthly_hebei_anguo_deseason.pdf", width=11)
set.seed(1)
TheilSen(mydata=all_counties_daily,
         pollutant="Anguo",
         main=paste("Anguo (Hebei) Monthly Deseasoned TheilSen Plot"),
         deseason=TRUE, avg.time="month",
         ylab=y_expression)
dev.off()

pdf("TheilSen_monthly_hebei_anguo.pdf", width=11)
set.seed(1)
county_TheilSen <- TheilSen(mydata=all_counties_daily,
         pollutant="Anguo",
         main=paste("Anguo (Hebei) Monthly TheilSen Plot"),
         deseason=FALSE, avg.time="month",
         ylab=y_expression)
county_TheilSen$data[[2]]
dev.off()

y_expression <- expression(PM[2.5] ~ (ug/m^3))
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/plots")
pdf("TheilSen_monthly_hebei_luquan_deseason.pdf", width=11)
set.seed(1)
TheilSen(mydata=all_counties_daily,
         pollutant="Luquan",
         main=paste("Luquan (Hebei) Monthly Deseasoned TheilSen Plot"),
         deseason=TRUE, avg.time="month",
         ylab=y_expression)
dev.off()

pdf("TheilSen_monthly_hebei_luquan.pdf", width=11)
set.seed(1)
county_TheilSen<- TheilSen(mydata=all_counties_daily,
         pollutant="Luquan",
         main=paste("Luquan (Hebei) Monthly TheilSen Plot"),
         deseason=FALSE, avg.time="month",
         ylab=y_expression)
county_TheilSen$data[[2]]
dev.off()

#liaoning
y_expression <- expression(PM[2.5] ~ (ug/m^3))
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/plots")
pdf("TheilSen_monthly_liaoning_fengcheng_deseason.pdf", width=11)
set.seed(1)
TheilSen(mydata=all_counties_daily,
         pollutant="Fengcheng",
         main=paste("Fengcheng (Liaoning) Monthly Deseasoned TheilSen Plot"),
         deseason=TRUE, avg.time="month",
         ylab=y_expression)
dev.off()

pdf("TheilSen_monthly_liaoning_fengcheng.pdf", width=11)
set.seed(1)
county_TheilSen<- TheilSen(mydata=all_counties_daily,
         pollutant="Fengcheng",
         main=paste("Fengcheng (Liaoning) Monthly TheilSen Plot"),
         deseason=FALSE, avg.time="month",
         ylab=y_expression)
county_TheilSen$data[[2]]
dev.off()

y_expression <- expression(PM[2.5] ~ (ug/m^3))
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/plots")
pdf("TheilSen_monthly_liaoning_zhangwu_deseason.pdf", width=11)
set.seed(1)
TheilSen(mydata=all_counties_daily,
         pollutant="Zhangwu",
         main=paste("Zhangwu (Liaoning) Monthly Deseasoned TheilSen Plot"),
         deseason=TRUE, avg.time="month",
         ylab=y_expression)
dev.off()

pdf("TheilSen_monthly_liaoning_zhangwu.pdf", width=11)
set.seed(1)
county_TheilSen<- TheilSen(mydata=all_counties_daily,
         pollutant="Zhangwu",
         main=paste("Zhangwu (Liaoning) Monthly TheilSen Plot"),
         deseason=FALSE, avg.time="month",
         ylab=y_expression)
county_TheilSen$data[[2]]
dev.off()

#ningxia
y_expression <- expression(PM[2.5] ~ (ug/m^3))
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/plots")
pdf("TheilSen_monthly_ningxia_pingluo_deseason.pdf", width=11)
set.seed(1)
TheilSen(mydata=all_counties_daily,
         pollutant="Pingluo",
         main=paste("Pingluo (Ningxia) Monthly Deseasoned TheilSen Plot"),
         deseason=TRUE, avg.time="month",
         ylab=y_expression)
dev.off()

pdf("TheilSen_monthly_ningxia_pingluo.pdf", width=11)
set.seed(1)
county_TheilSen<- TheilSen(mydata=all_counties_daily,
         pollutant="Pingluo",
         main=paste("Pingluo (Ningxia) Monthly TheilSen Plot"),
         deseason=FALSE, avg.time="month",
         ylab=y_expression)
county_TheilSen$data[[2]]
dev.off()

y_expression <- expression(PM[2.5] ~ (ug/m^3))
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/plots")
pdf("TheilSen_monthly_ningxia_qingtongxia_deseason.pdf", width=11)
set.seed(1)
TheilSen(mydata=all_counties_daily,
         pollutant="Qingtongxia",
         main=paste("Qingtongxia (Ningxia) Monthly Deseasoned TheilSen Plot"),
         deseason=TRUE, avg.time="month",
         ylab=y_expression)
dev.off()

pdf("TheilSen_monthly_ningxia_qingtongxia.pdf", width=11)
set.seed(1)
county_TheilSen<-TheilSen(mydata=all_counties_daily,
         pollutant="Qingtongxia",
         main=paste("Qingtongxia (Ningxia) Monthly TheilSen Plot"),
         deseason=FALSE, avg.time="month",
         ylab=y_expression)
county_TheilSen$data[[2]]
dev.off()

#shanxi
y_expression <- expression(PM[2.5] ~ (ug/m^3))
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/plots")
pdf("TheilSen_monthly_shanxi_changzhi_deseason.pdf", width=11)
set.seed(1)
TheilSen(mydata=all_counties_daily,
         pollutant="Changzhi",
         main=paste("Changzhi (Shanxi) Monthly Deseasoned TheilSen Plot"),
         deseason=TRUE, avg.time="month",
         ylab=y_expression)
dev.off()

pdf("TheilSen_monthly_shanxi_changzhi.pdf", width=11)
set.seed(1)
county_TheilSen<-TheilSen(mydata=all_counties_daily,
         pollutant="Changzhi",
         main=paste("Changzhi (Shanxi) Monthly TheilSen Plot"),
         deseason=FALSE, avg.time="month",
         ylab=y_expression)
county_TheilSen$data[[2]]
dev.off()

y_expression <- expression(PM[2.5] ~ (ug/m^3))
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/plots")
pdf("TheilSen_monthly_shanxi_gaoping_deseason.pdf", width=11)
set.seed(1)
TheilSen(mydata=all_counties_daily,
         pollutant="Gaoping",
         main=paste("Gaoping (Shanxi) Monthly Deseasoned TheilSen Plot"),
         deseason=TRUE, avg.time="month",
         ylab=y_expression)
dev.off()

pdf("TheilSen_monthly_shanxi_gaoping.pdf", width=11)
set.seed(1)
county_TheilSen<-TheilSen(mydata=all_counties_daily,
         pollutant="Gaoping",
         main=paste("Gaoping (Shanxi) Monthly TheilSen Plot"),
         deseason=FALSE, avg.time="month",
         ylab=y_expression)
county_TheilSen$data[[2]]
dev.off()

#shaanxi
y_expression <- expression(PM[2.5] ~ (ug/m^3))
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/plots")
pdf("TheilSen_monthly_shaanxi_chenggu_deseason.pdf", width=11)
set.seed(1)
TheilSen(mydata=all_counties_daily,
         pollutant="Chenggu",
         main=paste("Chenggu (Shaanxi) Monthly Deseasoned TheilSen Plot"),
         deseason=TRUE, avg.time="month",
         ylab=y_expression)
dev.off()

pdf("TheilSen_monthly_shaanxi_chenggu.pdf", width=11)
set.seed(1)
county_TheilSen<-TheilSen(mydata=all_counties_daily,
         pollutant="Chenggu",
         main=paste("Chenggu (Shaanxi) Monthly TheilSen Plot"),
         deseason=FALSE, avg.time="month",
         ylab=y_expression)
county_TheilSen$data[[2]]
dev.off()

y_expression <- expression(PM[2.5] ~ (ug/m^3))
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/plots")
pdf("TheilSen_monthly_shaanxi_qishan_deseason.pdf", width=11)
set.seed(1)
TheilSen(mydata=all_counties_daily,
         pollutant="Qishan",
         main=paste("Qishan (Shaanxi) Monthly Deseasoned TheilSen Plot"),
         deseason=TRUE, avg.time="month",
         ylab=y_expression)
dev.off()

pdf("TheilSen_monthly_shaanxi_qishan.pdf", width=11)
set.seed(1)
county_TheilSen<-TheilSen(mydata=all_counties_daily,
         pollutant="Qishan",
         main=paste("Qishan (Shaanxi) Monthly TheilSen Plot"),
         deseason=FALSE, avg.time="month",
         ylab=y_expression)
county_TheilSen$data[[2]]
dev.off()


# province timeVariation --------------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/province_level/partial")
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
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/province_level/partial/plots")
set.seed(1)
timeVar_liaoning <- timeVariation(mydata=liaoning_date_split,
                                  pollutant=c("Liaoning"),
                                  group="split.by",
                                  main=paste("Liaoning PM2.5 Before and After Coal-to-Electricity Policy by Month"),
                                  ylab=y_expression,
                                  ref.y = list(h = 75, lty = 5))
pdf("timeVariation_daily_liaoning_before_after.pdf", width=9)
plot(timeVar_liaoning, subset="month")
dev.off()


















