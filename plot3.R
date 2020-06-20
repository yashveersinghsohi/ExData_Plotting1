## Loading the Dataset
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
sub_data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

## storing Metering Details in numeric data type
sub1 <- as.numeric(sub_data$Sub_metering_1)
sub2 <- as.numeric(sub_data$Sub_metering_2)
sub3 <- as.numeric(sub_data$Sub_metering_3)

## Getting Date and Time columns in correct format
datetime <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## storing plot as "plot3.png"
png("plot3.png", width = 480, height = 480)
plot(datetime, sub1, type = "l", xlab = "", ylab="Energy Submetering")
lines(datetime, sub2, type = "l", col = "red")
lines(datetime, sub3, type = "l", col = "blue")
dev.off()