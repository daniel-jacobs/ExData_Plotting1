library(data.table)
data <- fread("household_power_consumption.txt", skip="1/2/2007", header=FALSE, nrows=2880)
colNames <- names(fread("household_power_consumption.txt", header=TRUE, sep=";", nrows=0))
setnames(data, colNames)
data[,DateTime:=with(data,paste(Date,Time, sep=" "))]
data$DateTime <- as.POSIXct(strptime(data$DateTime, "%d/%m/%Y %H:%M:%S"))

png("plot2.png", width = 480, height = 480)
plot(data$DateTime,data$Global_active_power,type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()