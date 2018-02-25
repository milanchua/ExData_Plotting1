setwd("C:/Users/GianMilan/Desktop/Exploratory Data Analysis")
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", 
                 stringsAsFactors = FALSE, na.strings = "?", nrows = 2075259)
subsetData <- rbind(data[data$Date == "1/2/2007",],data[data$Date=="2/2/2007",])
subsetData$Date <- as.Date(subsetData$Date,"%d/%m/%Y")
subsetData <- cbind(subsetData, "DateTime" = as.POSIXct(paste(subsetData$Date, subsetData$Time)))

png(filename = "plot2.png", width = 480, height = 480)
plot(subsetData$Global_active_power~subsetData$DateTime, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()