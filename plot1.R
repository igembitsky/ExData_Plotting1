##Load and prep data

#set working directory
setwd("/Users/Igor/Coursera/ExploratoryAnalysis")

#load data into R, noting that the separator is an ";" and NAs are "?"
edata <- read.csv("household_power_consumption.txt", sep = ";", na.strings ="?")

#convert to "Date" to proper class
edata$Date <- as.Date(edata$Date, format="%d/%m/%Y")

#subset data into only 2007-02-01 & 2007-02-02 
edata_dates <- edata[(edata$Date=="2007-02-01") | (edata$Date=="2007-02-02"),]

##Plot 1
png(filename = "plot1.png", width = 480, height = 480)

hist(edata_dates$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()