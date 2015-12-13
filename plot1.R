## Exploratory Data Analysis - Course Project 1 - Plot 1

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

## Create file to save histogram to
png('plot1.png', width = 480, height = 480)

## Create histogram
hist(household_power_consumption$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")

## Close plot1.png
dev.off()