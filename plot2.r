##Read data from the working directory and generate subset of data for exploratory data analysis 
rawdata <- "./household_power_consumption.txt"
tabdata <- read.table(rawdata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subset_data <- tabdata[tabdata$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

global_active_power <- as.numeric(subset_data$Global_active_power)


##Generate a new plot2.png file with dimensions  480 x 480 pixels
png("plot2.png", width=480, height=480)


##Generate line graph of Global Active Power fron Thursday to Saturday. 
plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")


##Close base plotting system and completes the plot2.png file.
dev.off()
