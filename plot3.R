#Plot 3

setwd("C:/Users/murack/Desktop/explore-data")
electric<-read.table("household_power_consumption.txt", header=TRUE, sep= ";")
electricsub<-subset(electric, Date=="1/2/2007" | Date=="2/2/2007")

electricsub$Date<-as.character(electricsub$Date)
electricsub$Time<-as.character(electricsub$Time)
electricsub$date.time<-paste(electricsub$Date, electricsub$Time)
electricsub$date.time<-strptime(electricsub$date.time, "%d/ %m/ %Y %H: %M: %S")

electricsub$Sub_metering_1<-as.numeric(as.character(electricsub$Sub_metering_1))
electricsub$Sub_metering_2<-as.numeric(as.character(electricsub$Sub_metering_2))
electricsub$Sub_metering_3<-as.numeric(as.character(electricsub$Sub_metering_3))

png(filename="plot3.png")

with(electricsub, plot(date.time, Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))
with(electricsub, lines(date.time, Sub_metering_1))
with(electricsub, lines(date.time, Sub_metering_2, col="red"))
with(electricsub, lines(date.time, Sub_metering_3, col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
