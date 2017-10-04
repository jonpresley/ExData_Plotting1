setwd("/Users/jonpresley/Desktop/R_Working_Directory")
data_all <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", dec = ".", stringsAsFactors = FALSE)
data <- data_all[data_all$Date %in% c("1/2/2007","2/2/2007") , ]
GAP <- as.numeric(data$Global_active_power)
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()