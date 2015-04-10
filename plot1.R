Sys.setlocale("LC_ALL","C")

# Read ---------------------------------------------------

unzip("exdata-data-household_power_consumption.zip")

File <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.string ="?")

# Subset -------------------------------------------------

File$Date <- as.Date(File$Date,format="%d/%m/%Y")
TwoDays <- File[(File$Date == "2007-02-01" | File$Date == "2007-02-02"),] 

# Plot1 --------------------------------------------------

png(filename = "plot1.png")

hist(TwoDays$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="red")

dev.off()