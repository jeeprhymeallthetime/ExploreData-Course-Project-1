setwd("~/Coursera/workspace/exdata-data-household_power_consumption")
initial <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE, nrow=100)
classes <- sapply(initial, class)
#initial$Date <- as.Date(initial$Date, "%d/%m/%Y")
rt <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?", colClasses = classes)
rt$Date <- as.Date(rt$Date, "%d/%m/%Y")  #Changes date from Factor to Date
x <- paste(rt$Date, rt$Time)
rt$Time <- strptime(x, "%Y-%m-%d %H:%M:%S")
#summary(rt)
u <- rt$Date == "2007-02-01" | rt$Date == "2007-02-02"
#summary(u)
#summary(rt[u,])
subset <- rt[u, ]
png(file="plot3.png",width=480, height=480)
plot(subset$Time, subset$Sub_metering_1, type="l", ylab = "Energy Sub Metering", xlab="")
lines(subset$Time, subset$Sub_metering_2, type="l", ylab = "Energy Sub Metering", xlab="", col="red")
lines(subset$Time, subset$Sub_metering_3, type="l", ylab = "Energy Sub Metering", xlab="", col="blue")
legend('topright', names(subset)[7:9], lty=1, col=c('black', 'red', 'blue'), cex=1, pch=1)
dev.off ();