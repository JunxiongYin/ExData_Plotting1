# Load the data and subset from the dates 2007-02-01 and 2007-02-02
dataset <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
dataset$Date <- as.Date(strptime(dataset$Date, "%d/%m/%Y"))
dataset <- subset(dataset, dataset$Date=="2007-02-01" | dataset$Date=="2007-02-02")

# Construct the graph
dataset$Global_active_power <- as.numeric(as.character(dataset$Global_active_power))
hist(dataset$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="red")

# Save to PNG file
dev.copy(png, width=480, height=480, file="plot1.png")
dev.off()
