## Loading the Dataset
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
sub_data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

## storing Global_active_power in numeric data type
global_active_power <- as.numeric(sub_data$Global_active_power)

## Getting Date and Time columns in correct format
datetime <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## storing plot as "plot2.png"
png("plot2.png", width = 480, height = 480)
plot(datetime, global_active_power, type = "l", xlab = "", ylab="Global Active Power (kilowatts)")
dev.off()