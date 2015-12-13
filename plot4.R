## Project 1 - Exploratory Data Anaysis
## Loading data into R

Inputdata <- read.csv("D:/370140/R Programming/Workspace 1_3rd July 2014/exdata-data-household_power_consumption/household_power_consumption.txt", sep=';', na.strings="?")

## Changing date format

Inputdata$Date <- as.Date(Inputdata$Date, format="%d/%m/%Y")

## Subsetting oly the required data

datafinal <- subset(Inputdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Concatenating data

dateandtime <- paste(as.Date(datafinal$Date), datafinal$Time)
datafinal$Datetime <- as.POSIXct(dateandtime)

## Plot 4

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(datafinal, {
  plot(datafinal$Global_active_power ~ datafinal$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  plot(datafinal$Voltage ~ datafinal$Datetime, type="l",ylab="Voltage (volt)", xlab="")
  plot(datafinal$Sub_metering_1 ~ datafinal$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
  lines(datafinal$Sub_metering_2 ~ datafinal$Datetime,col='Red')
  lines(datafinal$Sub_metering_3 ~ datafinal$Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(datafinal$Global_reactive_power ~ datafinal$Datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
  
})

## Saving png file

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
