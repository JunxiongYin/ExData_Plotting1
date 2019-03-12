# Load the data and subset from the dates 2007-02-01 and 2007-02-02
dataset <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
dataset$Date <- as.Date(strptime(dataset$Date, "%d/%m/%Y"))
dataset <- subset(dataset, dataset$Date=="2007-02-01" | dataset$Date=="2007-02-02")

# Construct the graph
dataset$DT <- paste(dataset$Date, dataset$Time)
dataset$DT <- strptime(dataset$DT, "%Y-%m-%d %X")
dataset$Global_active_power <- as.numeric(as.character(dataset$Global_active_power))

plot(dataset$DT, dataset$Global_active_power, type="n", xlab="", 
     ylab="Global Active Power (kilowatts)")
lines(dataset$DT, dataset$Global_active_power)

# Save to PNG file
dev.copy(png, width=480, height=480, file="plot2.png")
dev.off()
