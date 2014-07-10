#Plot 1

setwd("C:/Users/murack/Desktop/explore-data")
electric<-read.table("household_power_consumption.txt", header=TRUE, sep= ";")
electricsub<-subset(electric, Date=="1/2/2007" | Date=="2/2/2007")

png(filename="plot1.png")

electricsub$Global_active_power_num<-as.numeric(as.character(electricsub$Global_active_power))
hist(electricsub$Global_active_power_num, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")

dev.off()
