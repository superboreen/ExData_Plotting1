# plot1.R
d1 <- read.csv('household_power_consumption.txt', sep=";", header=TRUE, stringsAsFactors=FALSE)
d1$Date <- as.Date(d1$Date,"%d/%m/%Y")
d1$Global_active_power <- as.numeric(d1$Global_active_power) 

str(d1)
# Subset down to dates we want.
d2 <- d1[d1$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]
d2$DateTime <- as.POSIXct(paste(d2$Date,d2$Time)) # more data wrangling on smaller subset

# PLOT 1 ####
png(file="plot1.png",height=480,width=480)
par(mfcol =c(1,1))
hist(d2$Global_active_power, 
     col="red", 
     xlab="Global Active Power (kilowatts).",
     main="Global Active Power.")
dev.off()
# ENDS ####