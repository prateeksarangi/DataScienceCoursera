data <- read.csv("~/ExData_Plotting1/household_power_consumption.txt", sep=";"
                 , na.strings = "?"
                 ,colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
dataSelect <- data[(data$Date >= "2007-02-01" & data$Date <="2007-02-02"),]

a1 = as.numeric(dataSelect$Sub_metering_1)
a2 = as.numeric(dataSelect$Sub_metering_2)
a3 = as.numeric(dataSelect$Sub_metering_3)

par(mfcol = c(1, 1))

plot( a1
      , type = "l"
      , col = "black"
      , ylab = "Energy sub metering"
      , xlab = ""
      , xaxt="n"
)
lines( a2
       , type = "l"
       , col = "red")

lines( a3
       , type = "l"
       , col = "blue")

legend("topright"
       , bty = "o"
       , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       , lwd=c(0.5, 0.5, 0.5)
       , col=c("black","red","blue")
)

axis(1, at=c(1, 1440, 2880),labels = c("Thu", "Fri", "Sat"))

dev.copy(png, file = "~/ExData_Plotting1/figure/plot3.png", width=480, height=480)
dev.off()