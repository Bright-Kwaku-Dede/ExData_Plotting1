# plot4.R

data_full <- read.table("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", stringsAsFactors=FALSE)
data <- subset(data_full, Date %in% c("1/2/2007", "2/2/2007"))
data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

# 1 - Global Active Power
plot(data$Datetime, data$Global_active_power, type="l",
     ylab="Global Active Power", xlab="")

# 2 - Voltage
plot(data$Datetime, data$Voltage, type="l",
     ylab="Voltage", xlab="datetime")

# 3 - Sub Metering
plot(data$Datetime, data$Sub_metering_1, type="l",
     ylab="Energy sub metering", xlab="")
lines(data$Datetime, data$Sub_metering_2, col="red")
lines(data$Datetime, data$Sub_metering_3, col="blue")
legend("topright", bty="n", col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

# 4 - Global Reactive Power
plot(data$Datetime, data$Global_reactive_power, type="l",
     ylab="Global Reactive Power", xlab="datetime")

dev.off()
