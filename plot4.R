## Setting correct locale for non-english systems
Sys.setlocale(category = "LC_ALL", locale = "English")

## Read household_power_consumption.txt to householdpc
householdpc <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?", stringsAsFactors = F)

## Create subset with the correct dates
mysubset <- subset(householdpc, householdpc$Date == "1/2/2007" | householdpc$Date == "2/2/2007")

## Convert character objects to Date class objects and create DateTime column with POSIXct class objects
mysubset$Date <- as.Date(mysubset$Date, format = "%d/%m/%Y")
mysubset$DateTime <- as.POSIXct(paste(mysubset$Date, mysubset$Time))

## Create plot4.png
png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

# Plot1,1
plot(mysubset$DateTime, mysubset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
# Plot1,2
plot(mysubset$DateTime, mysubset$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
# Plot2,1
plot(mysubset$DateTime, mysubset$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(mysubset$DateTime, mysubset$Sub_metering_2, col = "red", type = "l")
lines(mysubset$DateTime, mysubset$Sub_metering_3, col = "blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")
# Plot2,2
plot(mysubset$DateTime, mysubset$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
#
dev.off()