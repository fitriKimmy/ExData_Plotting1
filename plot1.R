df <- read.table("data/household_power_consumption.txt", sep=";", header = TRUE,na.strings = "?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

data$Time <- paste(data$Date, data$Time,sep = " ")
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%d/%m/%Y %H:%M:%S")

global_active_power <- subset(df, Date == "2007-02-01" | Date == "2007-02-02")$Global_active_power

png("figure/plot1.png")
hist(global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
