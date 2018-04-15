setwd("/Users/silencemac/Desktop/coursera/course4.1")
library(data.table)

#missing values are coded as "?". this can be changed by "na.strings".
dataOrig <- read.table("./household_power_consumption.txt", header=T, sep=";",
                       na.strings = "?", stringsAsFactors=F)

#subset dataset with two days only
dataSub <- subset(dataOrig, Date %in% c("1/2/2007", "2/2/2007"))
#convert dates and times
dataSub$Date <- as.Date(dataSub$Date, "%d/%m/%Y")
dateTime <- paste(dataSub$Date, dataSub$Time, sep = " ", "%Y-%m-%d %H:%M:%S")
dataSub$dateTime <- as.POSIXct(dateTime)

png(file = "plot4.png", width = 480, height = 480)

#arrange the four plots
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

plot(Global_active_power ~ dateTime, dataSub, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
plot(Voltage ~ dateTime, dataSub, type = "l", xlab = "datetime",
     ylab = "Voltage")
plot(Sub_metering_1 ~ dateTime, dataSub, type = "l", 
     ylab = "Global Active Power (kilowatts)")
lines(Sub_metering_2 ~ dateTime, dataSub, col = "red")
lines(Sub_metering_3 ~ dateTime, dataSub, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, cex = 0.6, bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(Global_reactive_power ~ dateTime, dataSub, type = "l", xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()
