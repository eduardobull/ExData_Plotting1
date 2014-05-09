## Setting correct locale for non-english systems
Sys.setlocale(category = "LC_ALL", locale = "English")

## Read household_power_consumption.txt to householdpc
householdpc <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?", stringsAsFactors = F)

## Create subset with the correct dates
mysubset <- subset(householdpc, householdpc$Date == "1/2/2007" | householdpc$Date == "2/2/2007")

## Convert character objects to Date class objects and create DateTime column with POSIXct class objects
mysubset$Date <- as.Date(mysubset$Date, format = "%d/%m/%Y")
mysubset$DateTime <- as.POSIXct(paste(mysubset$Date, mysubset$Time))

## Create plot3.png
png("plot3.png", width = 480, height = 480)
plot(mysubset$DateTime, mysubset$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")
lines(mysubset$DateTime, mysubset$Sub_metering_2, col = "red", type = "l")
lines(mysubset$DateTime, mysubset$Sub_metering_3, col = "blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()