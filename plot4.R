## Exploratory Data Analysis - Course Project 1 - Plot 4


## Check if Electric power consumption data is in the working directory
if(!file.exists("household_power_consumption.txt"))
{
  ## Check if zipped data is in working dirctory, if not download
  if(!file.exists("exdata_data_household_power_consumption.zip"))
  {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileUrl, destfile = "./exdata_data_household_power_consumption.zip")
  }  
  
  unzip("exdata_data_household_power_consumption.zip")
}

## Read in Electric power consumption data
household_power_consumption <- read.table("household_power_consumption.txt",
  header = T, sep = ";", dec = ".", na.strings = "?", stringsAsFactors = F)

## Obtain data for 2007-02-01 and 2007-02-02
household_power_consumption <- subset(household_power_consumption,
  Date == "1/2/2007" | Date == "2/2/2007")

## Create a date/time variable
household_power_consumption$DateTime <- strptime(paste(household_power_consumption$Date,
  household_power_consumption$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

## Create file to save histogram to
png('plot4.png', width = 480, height = 480)

## Setup plotting two rows and two columns
par(mfrow = c(2,2))

## Plot on first row and column
plot(household_power_consumption$DateTime,
     household_power_consumption$Global_active_power,
     xlab = "",
     ylab = "Global Active Power",
     col = "black",
     type = "l")

## Plot on first row second column
plot(household_power_consumption$DateTime,
     household_power_consumption$Voltage,
     xlab = "datetime",
     ylab = "Voltage",
     col = "black",
     type = "l")

## Plot on second row first column
plot(household_power_consumption$DateTime,
     household_power_consumption$Sub_metering_1,
     xlab = "",
     ylab = "Energy sub metering",
     col = "black",
     type = "l")

lines(household_power_consumption$DateTime, household_power_consumption$Sub_metering_2, col = "red")

lines(household_power_consumption$DateTime, household_power_consumption$Sub_metering_3, col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = c(1,1), bty = "n")

## Plot on second row second column
plot(household_power_consumption$DateTime,
     household_power_consumption$Global_reactive_power,
     xlab = "datetime",
     ylab = "Global_reactive_power",
     col = "black",
     type = "l")

## Close plot4.png
dev.off()