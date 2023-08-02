# Reading txt data 

file <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# Subset data

subdata <- subset(file,file$Date=="1/2/2007" | file$Date =="2/2/2007")

# Converting date format

datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Change to Numeric 

GlobalActivePower <- as.numeric(subdata$Global_active_power)

SubMetering_1 <- as.numeric(subdata$Sub_metering_1)

SubMetering_2 <- as.numeric(subdata$Sub_metering_2)

SubMetering_3 <- as.numeric(subdata$Sub_metering_3)

# Plotting 

png("Plot 3.png", width=480, height=480)


plot(datetime, SubMetering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, SubMetering_2, type="l", col="red")
lines(datetime, SubMetering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

dev.off()