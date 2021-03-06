data <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

data$Time <- paste(data$Date, data$Time,sep = " ")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%d/%m/%Y %H:%M:%S")

dataUse <- subset(data, data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"))

par(mfrow=c(1,1))
plot(dataUse$Time, dataUse$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines (dataUse$Time, dataUse$Sub_metering_2, col = "red")
lines (dataUse$Time, dataUse$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_1","Sub_metering_1"),col = c("black","red","blue"),lty = c(1,1,1))
dev.copy(png, file = "figure/plot3.png")
dev.off()