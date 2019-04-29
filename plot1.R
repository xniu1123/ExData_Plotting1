data <- read.delim(file="household_power_consumption.txt",header = TRUE,sep = ";",stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data1 <- data[data$Date=="2007-02-01",]
data2 <- data[data$Date=="2007-02-02",]
data3 <- rbind(data1,data2)

data3$Global_active_power <- as.numeric(data3$Global_active_power)
png("plot1.png", width=480, height=480)
hist(data3$Global_active_power,col = "red", main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()
