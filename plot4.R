# plot4.R
d1 <- read.csv('household_power_consumption.txt', sep=";", header=TRUE, stringsAsFactors=FALSE)
d1$Date <- as.Date(d1$Date,"%d/%m/%Y")
d1$Sub_metering_1 <- as.integer(d1$Sub_metering_1) 
d1$Sub_metering_2 <- as.integer(d1$Sub_metering_2) 
d1$Sub_metering_3 <- as.integer(d1$Sub_metering_3) 
d1$Voltage <- as.numeric(d1$Voltage) 
d1$Global_reactive_power <- as.numeric(d1$Global_reactive_power) 
d1$Global_active_power <- as.numeric(d1$Global_active_power) 

# Subset down to dates we want.
d2 <- d1[d1$Date %in% as.Date(c('2007-02-01', '2007-02-02')),] # subset using date
d2$DateTime <- as.POSIXct(paste(d2$Date,d2$Time)) # more data wrangling on smaller subset

png(file="plot4.png",height=480,width=480)
par(mfcol =c(2,2))
#1
plot(d2$DateTime, d2$Global_active_power, type="n",
     ylab="Global Active Power (kilowatts).",
     xlab="")
lines(d2$DateTime, d2$Global_active_power)

#2
plot(d2$DateTime, d2$Sub_metering_1,  type="n",
     ylab="Energy sub metering",
     xlab="")
lines(d2$DateTime, d2$Sub_metering_2, col="red")
lines(d2$DateTime, d2$Sub_metering_1, col="black")
lines(d2$DateTime, d2$Sub_metering_3, col="blue")
legend("topright", lty=1, lwd=3,
       col = c("black", "red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#3 
plot(d2$DateTime, d2$Voltage, type="n",
     ylab="Voltage",
     xlab="datetime")
lines(d2$DateTime, d2$Voltage)

#4
plot(d2$DateTime, d2$Global_reactive_power, type="n",
     xlab="datetime")
lines(d2$DateTime, d2$Global_reactive_power)
dev.off()
# ENDS ####