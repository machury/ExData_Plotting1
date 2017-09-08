
#1. Load the data
setwd("C:\\Users\\machury\\Documents\\coursera\\month4\\week1\\data")

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

householdPowerConsumptionSubset$Global_active_power <- as.numeric(as.character(householdPowerConsumptionSubset$Global_active_power))

#Create a PNG device
png("plot2.png", 480, 480)

#Output there plot 2
with(householdPowerConsumptionSubset, plot(Date_Time, Global_active_power, type ="l", xlab = "",
                                           ylab = "Global Active Power (kilowatts)"))
#turn off device
dev.off()