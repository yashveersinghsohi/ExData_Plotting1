## Loading the Dataset
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
sub_data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

## storing Global_active_power in numeric data type
global_active_power <- as.numeric(sub_data$Global_active_power)

## storing plot as "plot1.png"
png("plot1.png", width = 480, height = 480)
hist(global_active_power, col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()