library(ggplot2)
library(data.table)


if(!file.exists('data')) dir.create('data')
fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(fileUrl, destfile = './data/household_power_consumption.zip')
unzip('./data/household_power_consumption.zip', exdir = './data')


file1 <- file("./data/household_power_consumption.txt")

el_data  <- read.table(text = grep("^[1,2]/2/2007", readLines(file1), value = TRUE), 
                       col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", 
                                     "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                       sep = ";", header = TRUE, stringsAsFactors=F, na.strings = "?")


######### plot histogramm ###################################

with(el_data, hist(Global_active_power, xlab= "Global Active Power(kilowatts)",col = "red",  main="Global Active Power"))

dev.copy(png, "./figure/plot1.png")
dev.off()
