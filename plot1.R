## Plot 1: Global Active Power (Histogram)

## Load the dataset, "household_power_consumption.txt"
data.file <- paste(getwd(), "/household_power_consumption.txt", sep="")
data <- read.table(data.file, header = TRUE, sep=";", stringsAsFactors = FALSE, dec = ".", na.strings = "?")

## Convert the Date variable and then subset the data from the dates 2007-02-01 and 2007-02-02
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data.new <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Plot a histrogram for the variable "Global_active_power" from the data.new
hist(data.new$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", col = "Red")

## Save the plot to a PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()

