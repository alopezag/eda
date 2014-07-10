# Project 1: Electric Power Consumption
#--------------------------------------
# Dataset: Electic Power Consumption 
# Author: Angel Lopez

# set working directory
setwd("~/Documents/EDA/proj1")
#option (b): A subset
#------------ 
library(sqldf)
sub1 <- read.csv2.sql("household_power_consumption.txt",sql="SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'",sep=";",na.strings="?" )
sub1$Date <- as.Date(as.character(sub1$Date),"%d/%m/%Y")

#Adding variable DateTime (plots: 2, 3, 4)
sub1$DateTime <- strptime( paste(sub1$Date,sub1$Time), format="%Y-%m-%d %H:%M:%S")

#PLOT 2: Global Active Power (plot type = line)
#---------------------------
png(file="plot2.png",width=480,height=480)
par(mfrow=c(1,1), mar=c(2,4,1,1))
plot(x=sub1$DateTime, y=sub1$Global_active_power, type="l", ylab="Global Active Power (kilowatts)")
dev.off()