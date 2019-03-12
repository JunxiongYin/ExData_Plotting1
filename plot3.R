# Load the data and subset from the dates 2007-02-01 and 2007-02-02
dataset <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
dataset$Date <- as.Date(strptime(dataset$Date, "%d/%m/%Y"))
dataset <- subset(dataset, dataset$Date=="2007-02-01" | dataset$Date=="2007-02-02")

# Construct the graph
dataset$DT <- paste(dataset$Date, dataset$Time)
dataset$DT <- strptime(dataset$DT, "%Y-%m-%d %X")
dataset$Global_active_power <- as.numeric(as.character(dataset$Global_active_power))
dataset$Sub_metering_1 <- as.numeric(as.character(dataset$Sub_metering_1))
dataset$Sub_metering_2 <- as.numeric(as.character(dataset$Sub_metering_2))
dataset$Sub_metering_3 <- as.numeric(as.character(dataset$Sub_metering_3))

plot(dataset$DT, dataset$Sub_metering_1, type="n", xlab="", 
     ylab="Energy sub meeting")
lines(dataset$DT, dataset$Sub_metering_1)
lines(dataset$DT, dataset$Sub_metering_2, col="red")
lines(dataset$DT, dataset$Sub_metering_3, col="blue")
legend("topright", col=c("black", "blue", "red"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1))

# Save to PNG file
dev.copy(png, width=480, height=480, file="plot3.png")
dev.off()
