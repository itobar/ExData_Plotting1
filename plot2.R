# This script loads the raw data, reformats data as needed, and creates plot2.png

# Load the raw data
rawdata <- "./data/household_power_consumption.txt"

# Read the raw data as a table and subset by date
data <- read.table(rawdata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Convert Date and Time variables to R Date/Time classes
datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Chage raw input to numeric values for subset_data
global_active_power <- as.numeric(subset_data$Global_active_power)

# Adjust plot settings
png("plot2.png", width=480, height=480)

# Plot graph
plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Turn off print device
dev.off()