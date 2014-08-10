data <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)

dates <- data$Date[data$Date == "1/2/2007" | data$Date == "2/2/2007"]
times <- data$Time[data$Date == "1/2/2007" | data$Date == "2/2/2007"]

meter1 <- as.numeric(data$Sub_metering_1[data$Date == "1/2/2007" | data$Date == "2/2/2007"])
meter2 <- as.numeric(data$Sub_metering_2[data$Date == "1/2/2007" | data$Date == "2/2/2007"])
meter3 <- as.numeric(data$Sub_metering_3[data$Date == "1/2/2007" | data$Date == "2/2/2007"])

datetimes = as.factor(paste(dates, times))


png('plot3.png')

plot(datetimes, meter1, main="", ylab="Energy sub metering", ylim=c(0, 40), xaxt='n', yaxt='n')
lines(datetimes, meter1, col="black")

par(new=T)

plot(datetimes, meter2, main="", xlab="", ylim=c(0, 40), xaxt='n', yaxt='n')
lines(datetimes, meter2, col="red")

par(new=T)

plot(datetimes, meter3, main="", xlab="", ylim=c(0, 40), xaxt='n', yaxt='n')
lines(datetimes, meter3, col="blue")

axis(side=1, at=c("1", "1440", "2880"), labels=c("Thu", "Fri", "Sat"))
axis(side=2, at=seq(0, 30, by=10))

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), lwd=c(2.5,2.5),col=c("black", "red", "blue"))

dev.off()