#Plot 4

setwd("C:/Users/murack/Desktop/explore-data")
electric<-read.table("household_power_consumption.txt", header=TRUE, sep= ";")
electricsub<-subset(electric, Date=="1/2/2007" | Date=="2/2/2007")

electricsub$Global_active_power<-as.numeric(as.character(electricsub$Global_active_power))

electricsub$Date<-as.character(electricsub$Date)
electricsub$Time<-as.character(electricsub$Time)
electricsub$date.time<-paste(electricsub$Date, electricsub$Time)
electricsub$date.time<-strptime(electricsub$date.time, "%d/ %m/ %Y %H: %M: %S")

electricsub$Sub_metering_1<-as.numeric(as.character(electricsub$Sub_metering_1))
electricsub$Sub_metering_2<-as.numeric(as.character(electricsub$Sub_metering_2))
electricsub$Sub_metering_3<-as.numeric(as.character(electricsub$Sub_metering_3))
electricsub$Voltage<-as.numeric(as.character(electricsub$Voltage))
electricsub$Global_reactive_power<-as.numeric(as.character(electricsub$Global_reactive_power))

png(filename="plot4.png")

par(mfrow = c(2, 2))

with(electricsub, {
  plot(date.time, Global_active_power, type="n", ylab="Global Active Power", xlab="")
  lines(date.time, Global_active_power)
  plot(date.time, Voltage, type="n")
  lines(date.time, Voltage)
  plot(date.time, Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
  lines(date.time, Sub_metering_1)
  lines(date.time, Sub_metering_2, col="red")
  lines(date.time, Sub_metering_3, col="blue")
  legend("topright",bty="n", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(date.time, Global_reactive_power, type="n")
  lines(date.time, Global_reactive_power)
})

dev.off()
