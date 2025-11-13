# plot2.R

# Read and subset data
data_full <- read.table("household_power_consumption.txt", 
                        header=TRUE, sep=';', na.strings="?", stringsAsFactors=FALSE)

# Keep only the two days we need
data <- subset(data_full, Date %in% c("1/2/2007", "2/2/2007"))

# Combine Date and Time into one datetime object
data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Convert Global Active Power to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

# Create the PNG file
png("plot2.png", width=480, height=480)

# Draw the line plot
plot(data$Datetime, data$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

# Close the file
dev.off()
