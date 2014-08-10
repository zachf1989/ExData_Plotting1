data <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)

dates <- data$Date[data$Date == "1/2/2007" | data$Date == "2/2/2007"]
times <- data$Time[data$Date == "1/2/2007" | data$Date == "2/2/2007"]

powers <- as.numeric(data$Global_active_power[data$Date == "1/2/2007" | data$Date == "2/2/2007"])
powers <- powers[!is.na(powers)]

datetimes = as.factor(paste(dates, times))


png('plot2.png')

plot(datetimes, powers, main="", xlab="", ylab="Global Active Power (kilowatts)", xaxt='n')
lines(datetimes, powers)
axis(side=1, at=c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))

dev.off()