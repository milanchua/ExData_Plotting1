setwd("C:/Users/GianMilan/Desktop/Exploratory Data Analysis")
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", 
                 stringsAsFactors = FALSE, na.strings = "?", nrows = 2075259)
subsetData <- rbind(data[data$Date == "1/2/2007",],data[data$Date=="2/2/2007",])
subsetData$Date <- as.Date(subsetData$Date,"%d/%m/%Y")
subsetData <- cbind(subsetData, "DateTime" = as.POSIXct(paste(subsetData$Date, subsetData$Time)))

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(subsetData$Global_active_power ~subsetData$DateTime, type = "l", 
     ylab = "Global Active Power", xlab ="datetime")

plot(subsetData$Voltage~subsetData$DateTime, type = "l",
     ylab = "Voltage", xlab ="")

with(subsetData, {plot(Sub_metering_1~DateTime, type = "l", ylab = "Energy Sub Metering", xlab = "")})
lines(subsetData$Sub_metering_2~subsetData$DateTime, col = "Red")
lines(subsetData$Sub_metering_3~subsetData$DateTime, col = "Blue")

plot(subsetData$Global_reactive_power~subsetData$DateTime, type = "l",
     ylab = "Global_reactive_power", xlab = "datetime")
dev.off()