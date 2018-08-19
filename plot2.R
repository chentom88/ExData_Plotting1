source("common.R")

# This will download the file if it does not
# yet exists. Please see common.R
data <- get_data()

with(data, plot(datetime, 
                Global_active_power, 
                type="l", 
                ylab="Global Active Power (kilowatts)", 
                xlab=""))

dev.copy(png, "plot2.png")
dev.off()
