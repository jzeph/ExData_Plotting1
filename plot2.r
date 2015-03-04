#plot2.R script for Course Project 1 in Exploratory Data Analysis class

#This script will plot aspects of the "Individual household electric power consumption Data set" provided by the UC Irvine Machine Learning Repository.

#Download the dataset from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip and then unzip dataset into your working directory in R.

#Calculate how much memory is needed to read in the data frame using
# 2,075,259 rows * 9 columns * 8 bytes / 2^20 = 142MB

#Read in the dataset
power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses = c(rep("character", 2), rep("numeric", 7)))

#Subset data; we only want dates 2007-02-01 and 2007-02-02.
power <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]

#Create date + time column and convert to POSIXlt format so we can graph data chronologically 
power$Timestamp <- paste(power$Date, power$Time)
power$Timestamp <- strptime(power$Timestamp, "%d/ %m/ %Y %H: %M: %S")

#Turn on png file device to hold plot output
png("plot2.png")

#Create plot 2, a line chart of Global Active Power (household global minute-averaged active power, in kilowatt) over the three days
plot(power$Timestamp, power$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type="n")
lines(power$Timestamp, power$Global_active_power)

#Turn off file device
dev.off()