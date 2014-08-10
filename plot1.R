data <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)

dates <- data$Date

powers <- as.numeric(data$Global_active_power[dates == "1/2/2007" | dates == "2/2/2007"])
powers <- powers[!is.na(powers)]


png('plot1.png')

hist(powers, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
axis(side=1, at=seq(0, 6, by=2))
axis(side=2, at=seq(0, 1200, by=200))

dev.off()