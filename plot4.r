##Read data from the working directory and generate subset of data for exploratory data analysis 
rawdata <- "./household_power_consumption.txt"
tabdata <- read.table(rawdata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subset_data <- tabdata[tabdata$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

global_active_power <- as.numeric(subset_data$Global_active_power)
global_reactive_power <- as.numeric(subset_data$Global_reactive_power)
voltage <- as.numeric(subset_data$Voltage)
sub_metering1 <- as.numeric(subset_data$Sub_metering_1)
sub_metering2 <- as.numeric(subset_data$Sub_metering_2)
sub_metering3 <- as.numeric(subset_data$Sub_metering_3)


## Generate a new plot4.png  file  with dimensions  480 x 480 pixels
png("plot4.png", width=480, height=480)


## Set parameter values; plot data on global active power, voltage, energy submetering, and global reactive power; and place legend on the energy submetering plot.  
par(mfrow = c(2, 2)) 
plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, sub_metering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_metering2, type="l", col="red")
lines(datetime, sub_metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

##Close base plotting system and completes the plot4.png file.
dev.off()
