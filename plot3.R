setwd("C:/Users/GianMilan/Desktop/Exploratory Data Analysis")
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", 
                 stringsAsFactors = FALSE, na.strings = "?", nrows = 2075259)
subsetData <- rbind(data[data$Date == "1/2/2007",],data[data$Date=="2/2/2007",])
subsetData$Date <- as.Date(subsetData$Date,"%d/%m/%Y")
subsetData <- cbind(subsetData, "DateTime" = as.POSIXct(paste(subsetData$Date, subsetData$Time)))


png(filename = "plot3.png", width = 480, height = 480)
with(subsetData, {plot(Sub_metering_1 ~ DateTime, type = "l", xlab = "", ylab = "Energy Sub Metering")})
lines(subsetData$Sub_metering_2 ~ subsetData$DateTime, col = "Red")
lines(subsetData$Sub_metering_3 ~ subsetData$DateTime, col = "Blue")
legend("topright", lty = 1, lwd = 1, col = c("Black","Red","Blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()