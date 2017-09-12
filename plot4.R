
#1. Load the data
setwd("C:\\Users\\Monika Achury\\Documents\\DataScienceClass\\Course4\\week1\\data")

#Note that in this dataset missing values are coded as ?
householdPowerConsumption <- read.delim2("household_power_consumption.txt", sep = ";", na.strings = "?")
householdPowerConsumption <- na.omit(householdPowerConsumption)
#convert the Date and Time variables to Date/Time classes in R using the strptime()  and as.Date() function
householdPowerConsumption$Date <- as.Date(householdPowerConsumption$Date, format = "%d/%m/%Y")

#We will only be using data from the dates 2007-02-01 and 2007-02-02. 
#Thus, read the data and then subsetting to those dates.
householdPowerConsumptionSubset <- subset(householdPowerConsumption, householdPowerConsumption$Date == "2007-02-01" |
                                            householdPowerConsumption$Date == "2007-02-02")

householdPowerConsumptionSubset$Date_Time <- strptime(paste(householdPowerConsumptionSubset$Date,householdPowerConsumptionSubset$Time),
                                                      "%Y-%m-%d %H:%M:%S")

householdPowerConsumptionSubset$Sub_metering_1 <- as.numeric(as.character(householdPowerConsumptionSubset$Sub_metering_1))
householdPowerConsumptionSubset$Sub_metering_2 <- as.numeric(as.character(householdPowerConsumptionSubset$Sub_metering_2))
householdPowerConsumptionSubset$Sub_metering_3 <- as.numeric(as.character(householdPowerConsumptionSubset$Sub_metering_3))
householdPowerConsumptionSubset$Global_active_power <- as.numeric(as.character(householdPowerConsumptionSubset$Global_active_power))
householdPowerConsumptionSubset$Voltage <- as.numeric(as.character(householdPowerConsumptionSubset$Voltage))
householdPowerConsumptionSubset$Global_reactive_power <- as.numeric(as.character(householdPowerConsumptionSubset$Global_reactive_power))

par(mfrow = c(2,2))

#1
with(householdPowerConsumptionSubset, plot(Date_Time, Global_active_power, type ="l", xlab = "",
                                           ylab = "Global Active Power (kilowatts)"))
#2
with(householdPowerConsumptionSubset, plot(Date_Time, Voltage, type ="l", xlab = "datetime"))

#3
with(householdPowerConsumptionSubset, plot(Date_Time, Sub_metering_1, type ="l", xlab = "", col="black",
                                           ylab = "Energy sub metering"))
with(householdPowerConsumptionSubset, points(Date_Time, Sub_metering_2, type ="l", col="red"))
with(householdPowerConsumptionSubset, points(Date_Time, Sub_metering_3, type ="l", col="blue"))
legend("topright", bty = "n", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#4
with(householdPowerConsumptionSubset, plot(Date_Time, Global_reactive_power, type ="l", xlab = "datetime"))

#print
#copy to png
dev.copy(png, "plot4.png", width=480, height=480)
#turn off device
dev.off()
