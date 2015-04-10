Sys.setlocale("LC_ALL","C")

# Read ---------------------------------------------------

unzip("exdata-data-household_power_consumption.zip")

File <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.string ="?")

# Subset -------------------------------------------------

File$Date <- as.Date(File$Date,format="%d/%m/%Y")
TwoDays <- File[(File$Date == "2007-02-01" | File$Date == "2007-02-02"),] 

TwoDays$datetime <- paste(TwoDays$Date,TwoDays$Time)
TwoDays$datetime <- strptime(TwoDays$datetime,format="%Y-%m-%d %H:%M:%S")

# Plot3 --------------------------------------------------

png(filename = "plot3.png")

with(TwoDays, plot(datetime,Sub_metering_1, type="l", xlab="", ylab=""))
with(TwoDays, points(datetime,Sub_metering_2, type="l", col = "red", xlab="", ylab=""))
with(TwoDays, points(datetime,Sub_metering_3, type="l", col = "blue", xlab="", ylab=""))
title(ylab="Energy sub metering")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1), col=c("black","red","blue"))

dev.off()
