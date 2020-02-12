data <- read.csv("~/ExData_Plotting1/household_power_consumption.txt", sep=";"
                , na.strings = "?"
                ,colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
                )

data$Date <- as.Date(data$Date, "%d/%m/%Y")

dataSelect <- data[(data$Date >= "2007-02-01" & data$Date <="2007-02-02"),]

par(mfcol = c(1, 1))

hist(dataSelect$Global_active_power
     , col = "red"
     , main = "Global Active Power"
     , xlab = "Global Active Power (kilowatts)")



dev.copy(png, file = "~/ExData_Plotting1/figure/plot1.png", width=480, height=480)
dev.off()