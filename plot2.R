## Plot 2: Global Active Power (Line Chart)

## Load the dataset, "household_power_consumption.txt"
data.file <- paste(getwd(), "/household_power_consumption.txt", sep="")
data <- read.table(data.file, header = TRUE, sep=";", stringsAsFactors = FALSE, dec = ".", na.strings = "?")

## Convert the Date variable and then subset the data from the dates 2007-02-01 and 2007-02-02
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data.new <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Convert the Date and Time variales to Date/Time classes using strptime()
timeStamp <- strftime(paste(data.new$Date, data.new$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")
data.new$timeStamp <- as.POSIXct(timeStamp)

## Plot a line chart for the variable "Global_active_power" against the variable timeStamp
plot(data.new$Global_active_power ~ data.new$timeStamp, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")

## Save the plot to a PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
