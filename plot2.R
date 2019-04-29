data <- read.delim(file="household_power_consumption.txt",header = TRUE,sep = ";",stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data1 <- data[data$Date=="2007-02-01",]
data2 <- data[data$Date=="2007-02-02",]
data3 <- rbind(data1,data2)
data3$DateTime <- paste(data3$Date,data3$Time,sep = " ")
data3$DateTime <- strptime(data3$DateTime,format = "%Y-%m-%d %H:%M:%S")

data3$Global_active_power <- as.numeric(data3$Global_active_power)
png("plot2.png", width=480, height=480)
plot(data3$DateTime,data3$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
