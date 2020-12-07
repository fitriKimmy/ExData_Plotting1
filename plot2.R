data <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

data$Time <- paste(data$Date, data$Time,sep = " ")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%d/%m/%Y %H:%M:%S")

dataUse <- subset(data, data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"))

par(mfrow=c(1,1))
plot(dataUse$Time, dataUse$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "figure/plot2.png")
dev.off()