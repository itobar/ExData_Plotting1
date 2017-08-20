# This script loads the raw data, reformats data as needed, and creates plot4.png

# Load the raw data
rawdata <- "./data/household_power_consumption.txt"

# Read the raw data as a table and subset by date
data <- read.table(rawdata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Convert Date and Time variables to R Date/Time classes
datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Chage raw input to numeric values for subset_data
global_active_power <- as.numeric(subset_data$Global_active_power)
global_reactive_power <- as.numeric(subset_data$Global_reactive_power)
voltage <- as.numeric(subset_data$Voltage)
sub_metering_1 <- as.numeric(subset_data$Sub_metering_1)
sub_metering_2 <- as.numeric(subset_data$Sub_metering_2)
sub_metering_3 <- as.numeric(subset_data$Sub_metering_3)

# Adjust plot settings
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

# Plot graph
plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, sub_metering_2, type="l", col="red")
lines(datetime, sub_metering_3, type="l", col="blue")
legend("topright", c("Sub metering 1", "Sub metering 2", "Sub metering 3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty = "o")
plot(datetime, global_reactive_power, type="l", xlab="datetime", ylab="Global Reactive Power")

# Turn off print device
dev.off()