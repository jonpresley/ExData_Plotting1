setwd("/Users/jonpresley/Desktop/R_Working_Directory")
data_all <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", dec = ".", stringsAsFactors = FALSE)
data <- data_all[data_all$Date %in% c("1/2/2007","2/2/2007") , ]
GAP <- as.numeric(data$Global_active_power)
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sm1 <- as.numeric(data$Sub_metering_1)
sm2 <- as.numeric(data$Sub_metering_2)
sm3 <- as.numeric(data$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, sm1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, sm2, type="l", col="red")
lines(datetime, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()