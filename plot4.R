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

##Plot 4
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with(edata_dates, {
  plot(Time, Global_active_power, 
  	type = "l", 
  	xlab = "", 
  	ylab = "Global Active Power")
  plot(Time, Voltage, 
  	xlab = "datetime", 
  	type = "l", 
  	ylab = "Voltage")
  yl = range(c(edata_dates$Sub_metering_1, edata_dates$Sub_metering_2, edata_dates$Sub_metering_3))
  plot(Time, Sub_metering_1, 
  	xlab = "", 
  	ylab = "Energy sub metering", 
  	type = "l", 
  	ylim = yl, 
  	col = "black")
  par(new = TRUE)
  plot(Time, Sub_metering_2, 
  	xlab = "", 
  	axes = FALSE, 
  	ylab = "", 
  	type = "l", 
  	ylim = yl, 
  	col = "red")
  par(new = TRUE)
  plot(Time, Sub_metering_3, 
  	xlab = "", 
  	axes = FALSE, 
  	ylab = "", 
  	type = "l", 
  	ylim = yl, 
  	col = "blue")
  legend("topright", 
  	legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
  	lty = c(1,1,1), 
  	col = c("black", "red", "blue")
  )
  plot(Time, Global_reactive_power, 
  	type = "l", 
  	xlab = "datetime", 
  	ylab = "Global_reactive_power")
})
dev.off