setwd("/Users/silencemac/Desktop/coursera/course4.1")
library(data.table)

#missing values are coded as "?". this can be changed by "na.strings".
dataOrig <- read.table("./household_power_consumption.txt", header=T, sep=";",
                       na.strings = "?", stringsAsFactors=F)

#subset dataset with two days only
dataSub <- subset(dataOrig, Date %in% c("1/2/2007", "2/2/2007"))

#generate the first plot
hist(dataSub$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", col = "red")

#save the plot to a PNG file wiht a width of 480 pixels and a height of 480 pixels
png(file = "plot1.png", width = 480, height = 480)
dev.off()