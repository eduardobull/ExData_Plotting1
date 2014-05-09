## Setting correct locale for non-english systems
Sys.setlocale(category = "LC_ALL", locale = "English")

## Read household_power_consumption.txt to householdpc
householdpc <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?", stringsAsFactors = F)

## Create subset with the correct dates
mysubset <- subset(householdpc, householdpc$Date == "1/2/2007" | householdpc$Date == "2/2/2007")

## Create plot1.png
png("plot1.png", width = 480, height = 480)
hist(mysubset$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()