library(data.table)
data <- fread("household_power_consumption.txt", skip="1/2/2007", header=FALSE, nrows=2880)
colNames <- names(fread("household_power_consumption.txt", header=TRUE, sep=";", nrows=0))
setnames(data, colNames)
data[,DateTime:=with(data,paste(Date,Time, sep=" "))]
data$DateTime <- as.POSIXct(strptime(data$DateTime, "%d/%m/%Y %H:%M:%S"))

png("plot3.png", width = 480, height = 480)

plot(data$DateTime,data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.off()