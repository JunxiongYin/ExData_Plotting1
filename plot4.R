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
dataset$Voltage <- as.numeric(as.character(dataset$Voltage))
dataset$Global_reactive_power <- as.numeric(as.character(dataset$Global_reactive_power))

par(mfrow=c(2,2))

## First plot
plot(dataset$DT, dataset$Global_active_power, type="n", xlab="", 
     ylab="Global Active Power")
lines(dataset$DT, dataset$Global_active_power)

## Second plot
plot(dataset$DT, dataset$Voltage, type="n", xlab="datetime", 
     ylab="Voltage")
lines(dataset$DT, dataset$Voltage)

## Third plot
plot(dataset$DT, dataset$Sub_metering_1, type="n", xlab="", 
     ylab="Energy sub meeting")
lines(dataset$DT, dataset$Sub_metering_1)
lines(dataset$DT, dataset$Sub_metering_2, col="red")
lines(dataset$DT, dataset$Sub_metering_3, col="blue")
legend("topright", col=c("black", "blue", "red"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n",
       y.intersp=0.5, lty=c(1,1,1))

## Fourth plot
plot(dataset$DT, dataset$Global_reactive_power, type="n", xlab="datetime", 
     ylab="Global_reactive_power")
lines(dataset$DT, dataset$Global_reactive_power)


# Save to PNG file
dev.copy(png, width=480, height=480, file="plot4.png")
dev.off()
