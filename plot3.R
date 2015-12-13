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

## Plot3

with(datafinal, {
  plot(datafinal$Sub_metering_1 ~ datafinal$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(datafinal$Sub_metering_2 ~ datafinal$Datetime, col='Red')
  lines(datafinal$Sub_metering_3 ~ datafinal$Datetime, col='Blue')
})

## Adding Legends

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving as png file

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()