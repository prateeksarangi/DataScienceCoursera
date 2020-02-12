data <- read.csv("~/ExData_Plotting1/household_power_consumption.txt", sep=";"
                 , na.strings = "?"
                 ,colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
)

data$Date <- as.Date(data$Date, "%d/%m/%Y")
dataSelect <- data[(data$Date >= "2007-02-01" & data$Date <="2007-02-02"),]

par(col = "black", mfcol = c(1, 1))

plot( dataSelect$Global_active_power
      , type = "l"
      , ylab = "Global Active Power (kilowatts)"
      , xlab = ""
      , xaxt="n"
)

axis(1, at=c(1, 1440, 2880),labels = c("Thu", "Fri", "Sat"))


dev.copy(png, file = "~/ExData_Plotting1/figure/plot2.png", width=480, height=480)
dev.off()