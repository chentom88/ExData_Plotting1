source("common.R")

# This will download the file if it does not
# yet exists. Please see common.R
data <- get_data()

par(mfrow=c(2,2), mgp=c(2.5,1,0), ps=8)

with(data, plot(datetime, Global_active_power, type="l", ylab="Global Active Power", xlab=""))

with(data, plot(datetime, Voltage, type="l"))

with(data, plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(data, lines(datetime, Sub_metering_2, col="red"))
with(data, lines(datetime, Sub_metering_3, col="blue"))
legend("topright",
       lty=c(1,1,1),
       box.lwd=0,
       y.intersp=0.6,
       col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(data, plot(datetime, Global_reactive_power, type="l"))

dev.copy(png, "plot4.png")
dev.off()
