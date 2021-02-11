##Read the data set
if (!file.exists('data')){
  dir.create('data')
}

URL <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL,destfile = 'data/exdata_data_household_power_consumption.zip')
file <- unzip('data/exdata_data_household_power_consumption.zip',exdir = 'data/')

##Subsetting the dates that we are going to analyze 
Complete <- read.table(file, header=T, sep=";")
Complete$Date <- as.Date(Complete$Date, format="%d/%m/%Y")
Data <- Complete[(Complete$Date=="2007-02-01") | (Complete$Date=="2007-02-02"),]

##Create the plot

Data <- transform(Data, Time_Date = as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

plot(Data$Time_Date, Data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(Data$Time_Date, Data$Sub_metering_2, col = "red")
lines(Data$Time_Date, Data$Sub_metering_3, col = "blue")
legend("topright", col = c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 1)




##Save the plot
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()

