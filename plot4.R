data <- read.delim(file="household_power_consumption.txt",header = TRUE,sep = ";",stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data1 <- data[data$Date=="2007-02-01",]
data2 <- data[data$Date=="2007-02-02",]
data3 <- rbind(data1,data2)
data3$DateTime <- paste(data3$Date,data3$Time,sep = " ")
data3$DateTime <- strptime(data3$DateTime,format = "%Y-%m-%d %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(data3$DateTime, data3$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(data3$DateTime, data3$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(data3$DateTime, data3$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(data3$DateTime, data3$Sub_metering_2, type="l", col="red")
lines(data3$DateTime, data3$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(data3$DateTime,data3$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()