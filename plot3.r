##Read data from the working directory and generate subset of data for exploratory data analysis 
rawdata <- "./household_power_consumption.txt"
tabdata <- read.table(rawdata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subset_data <- tabdata[tabdata$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

global_active_power <- as.numeric(subset_data$Global_active_power)
sub_metering1 <- as.numeric(subset_data$Sub_metering_1)
sub_metering2 <- as.numeric(subset_data$Sub_metering_2)
sub_metering3 <- as.numeric(subset_data$Sub_metering_3)


## Generate an empty plot3.png  file with dimensions  480 x 480 pixels
png("plot3.png", width=480, height=480)


## Specify data to be placed in the y axis and plots the sub_metering data using lines. The color of the lines are black, red and blue. 
plot(datetime, sub_metering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_metering2, type="l", col="red")
lines(datetime, sub_metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))


##Close base plotting system and completes the plot3.png file.
dev.off()
