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

#PLOT 4: 
#-------
png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2), mar=c(4,4,1,1))

#pos(1,1): Global Active Power
with(sub1, plot(x=DateTime, y=Global_active_power, ,type="l", ylab="Global Active Power", xlab=""))

#pos(1,2): Voltage
with(sub1,plot(x=DateTime, y=Voltage, ,type="l", ylab="Voltage", xlab="datetime"))

#pos(2,1): Energy sub metering
with(sub1, plot(x=DateTime, y=Sub_metering_1, col="black",type="l", ylab="Energy sub metering", xlab=""))
with(sub1, points(DateTime, Sub_metering_2, col="red", type="l"))
with(sub1, points(DateTime, Sub_metering_3, col="blue", type="l"))
legend("topright", col=c("black", "red","blue"), legend=names(sub1)[7:9], lty="solid")

#pos(2,2): Global_reactive_power
with(sub1, plot(x=DateTime, y=Global_reactive_power, ,type="l", xlab="datetime"))
dev.off()