

#1. Load the data
setwd("C:\\Users\\machury\\Documents\\coursera\\month4\\week1\\data")

#Note that in this dataset missing values are coded as ?
householdPowerConsumption <- read.delim2("household_power_consumption.txt", sep = ";", na.strings = "?")
householdPowerConsumption <- na.omit(householdPowerConsumption)
#convert the Date and Time variables to Date/Time classes in R using the strptime()  and as.Date() function
householdPowerConsumption$Date <- as.Date(householdPowerConsumption$Date, format = "%d/%m/%Y")
householdPowerConsumption$Time <- strptime(householdPowerConsumption$Time, format = "%H:%M:%S")

#We will only be using data from the dates 2007-02-01 and 2007-02-02. 
#Thus, read the data and then subsetting to those dates.
householdPowerConsumptionSubset <- subset(householdPowerConsumption, householdPowerConsumption$Date == "2007-02-01" |
                                            householdPowerConsumption$Date == "2007-02-02")

#create a device
png("plot1.png", 480, 480)

#Plot 1 - Construct the plot in the device 
hist(as.numeric(as.character(householdPowerConsumptionSubset$Global_active_power)), main = "Global Active Power",
     col = "Red", xlab = "Global Active Power (kilowatts)")

#turn off the device
dev.off()