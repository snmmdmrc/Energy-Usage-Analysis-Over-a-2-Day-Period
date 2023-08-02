# Reading txt data 

file <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# Subset data

subdata <- subset(file,file$Date=="1/2/2007" | file$Date =="2/2/2007")

# Converting date format

datetime <- as.Date(subdata [, 1], format = "%d%m%Y")

# change to days 

subdata <- strftime(subdata$Date,"%A")

# Plotting

png("Plot 2.png", width=480, height=480)

plot(datetime, subdata, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()