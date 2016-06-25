library(ggplot2)
library(data.table)

## read File

if(!file.exists('data')) dir.create('data')
fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(fileUrl, destfile = './data/household_power_consumption.zip')
unzip('./data/household_power_consumption.zip', exdir = './data')


file1 <- file("./data/household_power_consumption.txt")

## load data from file

el_data  <- read.table(text = grep("^[1,2]/2/2007", readLines(file1), value = TRUE), 
                       col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", 
                                     "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                       sep = ";", header = TRUE, stringsAsFactors=F, na.strings = "?")


## Converting dates
st_datetime <- paste(el_data$Date, el_data$Time)
el_data$Datetime <- strptime(st_datetime, "%d/%m/%Y %H:%M:%S")
el_data$Datetime <- as.POSIXct(el_data$Datetime)


######### plot4  ###################################


dev.copy(png, "./figure/plot4.png")
dev.off()
