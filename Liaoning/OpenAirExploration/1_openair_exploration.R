library(openair)
library(ggplot2)

# timeAverage Function ---------------------------------------------------

#load sample data
setwd("/rds/general/user/syl416/home/MScProject/Liaoning")
province <- readRDS("6_dataset_liaoning_sample_1000.rds")
#check class of data
class(province)
#check class of date column
class(province$date) #Date
head(province$date)

#ggplot daily
ggplot(province, aes(x = date, y = PM2.5)) +
  geom_line() +
  geom_smooth(method = "lm", se = TRUE) +
  labs(x="Date", y = "PM2.5 (μg/m³)", title= "Liaoning PM2.5: Daily")

#timeAverage: week
timeavg_week <- timeAverage(mydata=province, avg.time="week", 
            start.date="2015-01-01", end.date="2020-12-31")
#might need to say that it should be averaging the PM2.5? <-#####################
dim(timeavg_week)
head(timeavg_week)
dim(province)
head(province)

#ggplot week
ggplot(timeavg_week, aes(x = date, y = PM2.5)) +
  geom_line() +
  geom_smooth(method = "lm", se = TRUE) +
  labs(x="Date", y = "PM2.5 (μg/m³)", title= "Liaoning PM2.5: Weekly")

#timeAverage: month
timeavg_month <- timeAverage(mydata=province, avg.time="month", 
                            start.date="2015-01-01", end.date="2020-12-31")
#might need to say that it should be averaging the PM2.5? <-#####################
dim(timeavg_month)
head(timeavg_month)
dim(province)
head(province)

#ggplot month
ggplot(timeavg_month, aes(x = date, y = PM2.5)) +
  geom_line() +
  geom_smooth(method = "lm", se = TRUE) +
  labs(x="Date", y = "PM2.5 (μg/m³)", title= "Liaoning PM2.5: monthly")


# timePlot ----------------------------------------------------------------
timePlot(mydata=province, pollutant="PM2.5", smooth=TRUE, main="timePlot Liaoning daily")
timePlot(mydata=timeavg_week, pollutant="PM2.5", smooth=TRUE, main="timePlot Liaoning weekly")
timePlot(mydata=timeavg_month, pollutant="PM2.5", smooth=TRUE, main="timePlot Liaoning monthly")


# calendarPlot ------------------------------------------------------------
#I have to use timeAverage even for daily as there are multiple measurements 
#for the same day with a different GridID
province[province$date=="2020-12-28", ]

timeavg_daily <- timeAverage(mydata=province, avg.time="day", 
                             start.date="2015-01-01", end.date="2020-12-31")

timeavg_daily[timeavg_daily$date=="2020-12-28", ]

#find max PM2.5 to set limits so all plots have a consistent scale
head(sort(timeavg_daily$PM2.5, decreasing = TRUE)) #171.5250

calendarPlot(mydata=timeavg_daily, year=2015, pollutant="PM2.5", main="calendarPlot Liaoning 2015", limits=c(0,180))
calendarPlot(mydata=timeavg_daily, year=2016, pollutant="PM2.5", main="calendarPlot Liaoning 2016", limits=c(0,180))


# TheilSen ----------------------------------------------------------------
TheilSen(mydata=timeavg_daily, pollutant="PM2.5", main="TheilSen Liaoning")


# smoothTrend -------------------------------------------------------------
#calculates smooth trends in the monthly mean concentrations of pollutants
smoothTrend(mydata=timeavg_daily, pollutant="PM2.5", main="smoothTrend Liaoning")


# timeVariation -----------------------------------------------------------
timeVariation(mydata=timeavg_daily, pollutant="PM2.5", main="timeVariation Liaoning")
timeVariation(mydata=timeavg_daily, pollutant="PM2.5", type="season", main="timeVariation Liaoning")


# trendLevel --------------------------------------------------------------
trendLevel(mydata=timeavg_daily, pollutant="PM2.5", x="month", y="weekday", main="trendLevel Liaoning")
trendLevel(mydata=timeavg_daily, pollutant="PM2.5", x="season", y="weekday", main="trendLevel Liaoning")


# GoogleMapsPlot ----------------------------------------------------------
#this function was removed in an older version and a new version is being developed but not ready yet
#GoogleMapsPlot(mydata=timeavg_daily, pollutant="PM2.5", long="Longitude", lat="Latitude", main="GoogleMapsPlot Liaoning")











