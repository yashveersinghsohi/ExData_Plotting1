## Loading the Dataset
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
sub_data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

## storing Global_active_power, Global_reactive_power in numeric data type
global_active_power <- as.numeric(sub_data$Global_active_power)
global_reactive_power <- as.numeric(sub_data$Global_reactive_power)

## storing Voltage in numeric data type
voltage <- as.numeric(sub_data$Voltage)

## storing Metering Details in numeric data type
sub1 <- as.numeric(sub_data$Sub_metering_1)
sub2 <- as.numeric(sub_data$Sub_metering_2)
sub3 <- as.numeric(sub_data$Sub_metering_3)

## Getting Date and Time columns in correct format
datetime <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## storing plot as "plot4.png"
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2)) 

plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, sub1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub2, type="l", col="red")
lines(datetime, sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()