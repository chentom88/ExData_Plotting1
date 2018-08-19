source("common.R")

# This will download the file if it does not
# yet exists. Please see common.R
data <- get_data()

with(data, plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(data, lines(datetime, Sub_metering_2, col="red"))
with(data, lines(datetime, Sub_metering_3, col="blue"))
legend("topright",
       lty=c(1,1,1),
       col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, "plot3.png")
dev.off()
