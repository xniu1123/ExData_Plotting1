data <- read.delim(file="household_power_consumption.txt",header = TRUE,sep = ";",stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data1 <- data[data$Date=="2007-02-01",]
data2 <- data[data$Date=="2007-02-02",]
data3 <- rbind(data1,data2)
data3$DateTime <- paste(data3$Date,data3$Time,sep = " ")
data3$DateTime <- strptime(data3$DateTime,format = "%Y-%m-%d %H:%M:%S")

data3$Global_active_power <- as.numeric(data3$Global_active_power)
data3$Sub_metering_1 <- as.numeric(data3$Sub_metering_1)
data3$Sub_metering_2 <- as.numeric(data3$Sub_metering_2)
data3$Sub_metering_3 <- as.numeric(data3$Sub_metering_3)

png("plot3.png", width=480, height=480)
with(data3,plot(DateTime,Sub_metering_1,type="l",xlab="",ylab="Energy Submetering"))
with(data3,lines(DateTime,Sub_metering_2,type = "l",col="red"))
with(data3,lines(DateTime,Sub_metering_3,type="l",col="blue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,lwd = 2,col = c("black","red","blue"))
dev.off()