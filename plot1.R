# This script loads the raw data, reformats data as needed, and creates plot1.png

# Load the raw data
rawdata <- "./data/household_power_consumption.txt"

# Read the raw data as a table and subset by date
data <- read.table(rawdata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Chage raw input to numeric values for subset_data
global_active_power <- as.numeric(subset_data$Global_active_power)

# Adjust plot settings
png("plot1.png", width=480, height=480)

# Plot graph
hist(global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Turn off print device
dev.off()