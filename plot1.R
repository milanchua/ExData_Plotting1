setwd("C:/Users/GianMilan/Desktop/Exploratory Data Analysis")
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", 
                 stringsAsFactors = FALSE, na.strings = "?", nrows = 2075259)
subsetData <- rbind(data[data$Date == "1/2/2007",],data[data$Date=="2/2/2007",])
subsetData$Date <- as.Date(subsetData$Date,"%d/%m/%Y")
subsetData <- cbind(subsetData, "DateTime" = as.POSIXct(paste(subsetData$Date, subsetData$Time)))

png(filename = "plot1.png", width = 480, height = 480)
hist(as.numeric(subsetData$Global_active_power), col = "Red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts", ylab = "Frequency")
dev.off()