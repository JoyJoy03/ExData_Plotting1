## Plot 2: Energy sub metering

## Load the dataset, "household_power_consumption.txt"
data.file <- paste(getwd(), "/household_power_consumption.txt", sep="")
data <- read.table(data.file, header = TRUE, sep=";", stringsAsFactors = FALSE, dec = ".", na.strings = "?")

## Convert the Date variable and then subset the data from the dates 2007-02-01 and 2007-02-02
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data.new <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Convert the Date and Time variales to Date/Time classes using strptime()
timeStamp <- strftime(paste(data.new$Date, data.new$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")
data.new$timeStamp <- as.POSIXct(timeStamp)

## Plot a line chart of Energy sub metering 1, 2 and 3
plot(data.new$Sub_metering_1 ~ data.new$timeStamp, type = "l", ylab = "Energy sub metering", xlab = "")
lines(data.new$Sub_metering_2 ~ data.new$timeStamp, col = "red")
lines(data.new$Sub_metering_3 ~ data.new$timeStamp, col = "blue")

## Add legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), cex = 1, lwd = 1, lty = 1)

## Save the plot to a PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
