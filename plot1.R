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

##Create histogram


plot1 <- hist(table(Data$Global_active_power), col = "red", main = "Global Active Power", 
              xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

##Save the plot

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
