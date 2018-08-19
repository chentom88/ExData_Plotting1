source("common.R")

data <- get_data()

with(data, hist(Global_active_power, 
                col="red", 
                main="Global Active Power", 
                xlab="Global Active Power (kilowatts)"))
dev.copy(png, "plot1.png")
dev.off()