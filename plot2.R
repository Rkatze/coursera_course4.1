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

png(file = "plot2.png", width = 480, height = 480)

#type = "l" means lines; for the second plot
plot(Global_active_power ~ dateTime, data = dataSub, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")

dev.off()

