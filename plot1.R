library(data.table)
data <- fread("household_power_consumption.txt", skip="1/2/2007", header=FALSE, nrows=2880)
colNames <- names(fread("household_power_consumption.txt", header=TRUE, sep=";", nrows=0))
setnames(data, colNames)

png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power,xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power", col="red")
dev.off()