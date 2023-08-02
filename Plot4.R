# Reading txt data 

file <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# Subset data

subdata <- subset(file,file$Date=="1/2/2007" | file$Date =="2/2/2007")

# Converting date format and character

datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

GlobalActivePower <- as.numeric(subdata$Global_active_power)

SubMetering_1 <- as.numeric(subdata$Sub_metering_1)

SubMetering_2 <- as.numeric(subdata$Sub_metering_2)

SubMetering_3 <- as.numeric(subdata$Sub_metering_3)

# Base plot 

dev.off()

png("Plot 4.png", width=480, height=480)

par(mfrow=c(2,2))

# Basic plot 

#1

plot(datetime, subdata[, 3], xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

#2

plot(datetime, subdata[, 5], xlab = "datetime", ylab = "Voltage", type = "l")


#3 

plot(datetime, subdata[, 7], xlab = "", ylab = "Energy sub metering", type = "l")
lines(datetime, subdata[, 8], col = "red")
lines(datetime, subdata[, 9], col = "blue")

legend("topright", c("SubMetering_1", "SubMetering_2", "SubMetering_3"), col = c("black","red","blue"), lty=1, lwd=2)

#4

plot(datetime, subdata[, 4], xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.off()