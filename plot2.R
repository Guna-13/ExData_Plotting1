Sys.setlocale("LC_ALL","C")

# Read ---------------------------------------------------

unzip("exdata-data-household_power_consumption.zip")

File <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.string ="?")

# Subset -------------------------------------------------

File$Date <- as.Date(File$Date,format="%d/%m/%Y")
TwoDays <- File[(File$Date == "2007-02-01" | File$Date == "2007-02-02"),] 

TwoDays$datetime <- paste(TwoDays$Date,TwoDays$Time)
TwoDays$datetime <- strptime(TwoDays$datetime,format="%Y-%m-%d %H:%M:%S")

# Plot2 --------------------------------------------------

png(filename = "plot2.png")

plot(TwoDays$datetime,TwoDays$Global_active_power,type="l",
     xlab="",ylab="Global Active Power (kilowatts)")

dev.off()
