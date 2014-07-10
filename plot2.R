#Plot 2
setwd("C:/Users/murack/Desktop/explore-data")
electric<-read.table("household_power_consumption.txt", header=TRUE, sep= ";")
electricsub<-subset(electric, Date=="1/2/2007" | Date=="2/2/2007")

electricsub$Global_active_power_num<-as.numeric(as.character(electricsub$Global_active_power))
electricsub$Date<-as.character(electricsub$Date)
electricsub$Time<-as.character(electricsub$Time)
electricsub$date.time<-paste(electricsub$Date, electricsub$Time)
electricsub$date.time<-strptime(electricsub$date.time, "%d/ %m/ %Y %H: %M: %S")

png(filename="plot2.png")

with(electricsub, plot(date.time, Global_active_power_num, type="n", ylab="Global Active Power (kilowatts)", xlab=""))
lines(electricsub$date.time, electricsub$Global_active_power_num)

dev.off()
