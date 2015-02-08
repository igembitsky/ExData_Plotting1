##Load and prep data

#set working directory
setwd("/Users/Igor/Coursera/ExploratoryAnalysis")

#load data into R, noting that the separator is an ";" and NAs are "?"
edata <- read.csv("household_power_consumption.txt", sep = ";", na.strings ="?")

#convert to "Date" to proper class
edata$Date <- as.Date(edata$Date, format="%d/%m/%Y")

#subset data into only 2007-02-01 & 2007-02-02 
edata_dates <- edata[(edata$Date=="2007-02-01") | (edata$Date=="2007-02-02"),]

#convert "Time" to Date/Time and make proper class
edata_dates$Time <- paste(edata_dates$Date, edata_dates$Time, sep=" ")
edata_dates$Time <- strptime(edata_dates$Time, "%Y-%m-%d %H:%M:%S")

##Plot 2
png(filename = "plot2.png", width = 480, height = 480)
plot(edata_dates$Time, edata_dates$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()