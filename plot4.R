Power <- read.table("household_power_consumption.txt",header=TRUE,sep=";",quote="",  
                    stringsAsFactors=FALSE,comment.char="")

Power$Date <- as.Date(Power$Date , "%d/%m/%Y")

PowerSub <- Power[(Power$Date == as.Date("01/02/2007", "%d/%m/%Y") | Power$Date == as.Date("02/02/2007", "%d/%m/%Y") ),]
PowerSub[,3:9] <- sapply(PowerSub[,3:9] , as.numeric)
PowerSub$DateTime <- paste(PowerSub$Date , PowerSub$Time )
PowerSub$DateTime <- as.POSIXct(strptime (PowerSub$DateTime , "%Y-%m-%d %H:%M:%S"))

par(mfrow = c(2, 2))
with(PowerSub, {
        plot(PowerSub$DateTime , PowerSub$Global_active_power , type ="n", xlab =""  , ylab = "Global Active Power (kilowatts)" )
        lines(PowerSub$DateTime , PowerSub$Global_active_power )
        plot(PowerSub$DateTime , PowerSub$Voltage , type ="n", xlab ="datetime"  , ylab = "Voltage" )
        lines(PowerSub$DateTime , PowerSub$Voltage )
        plot(PowerSub$DateTime , PowerSub$Sub_metering_1 , type ="n", xlab =""  , ylab = "Energy Sub Metering" )
        lines(PowerSub$DateTime , PowerSub$Sub_metering_1 )
        lines(PowerSub$DateTime , PowerSub$Sub_metering_2 , col = "red" )
        lines(PowerSub$DateTime , PowerSub$Sub_metering_3 , col = "blue" )
        legend("topright",col=c("black","red","blue" ),pch="-" ,lty=1, lwd=0.5, bty="n",  cex=0.36 ,legend = c("Sub_metering_1" , "Sub_metering_2" , "Sub_metering_3"))
        plot(PowerSub$DateTime , PowerSub$Global_reactive_power , type ="n", xlab ="datetime" , ylab = "Global_reactive_power" )
        lines(PowerSub$DateTime , PowerSub$Global_reactive_power )
        
})

dev.copy(png, file = "plot4.png")
dev.off()
