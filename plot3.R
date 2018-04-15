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

#for the third plot, plot first the Sub_metering_1 ~ dateTime
plot(Sub_metering_1 ~ dateTime, dataSub, type = "l", 
     ylab = "Global Active Power (kilowatts)")
#add the other two variables to the plot (Sub_metering_2 and 3)
lines(Sub_metering_2 ~ dateTime, dataSub, col = "red")
lines(Sub_metering_3 ~ dateTime, dataSub, col = "blue")

#add legend
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, cex = 0.6, bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

png(file = "plot3.png", width = 480, height = 480)
dev.off()