## Plot 3 ##

Power <- read.table("household_power_consumption.txt",header=TRUE,sep=";",quote="",  
                    stringsAsFactors=FALSE,comment.char="")

Power$Date <- as.Date(Power$Date , "%d/%m/%Y")

PowerSub <- Power[(Power$Date == as.Date("01/02/2007", "%d/%m/%Y") | Power$Date == as.Date("02/02/2007", "%d/%m/%Y") ),]
PowerSub[,3:9] <- sapply(PowerSub[,3:9] , as.numeric)
PowerSub$DateTime <- paste(PowerSub$Date , PowerSub$Time )
PowerSub$DateTime <- as.POSIXct(strptime (PowerSub$DateTime , "%Y-%m-%d %H:%M:%S"))

plot(PowerSub$DateTime , PowerSub$Sub_metering_1 , type ="n", xlab =""  , ylab = "Energy Sub Metering" )

lines(PowerSub$DateTime , PowerSub$Sub_metering_1 )
lines(PowerSub$DateTime , PowerSub$Sub_metering_2 , col = "red" )
lines(PowerSub$DateTime , PowerSub$Sub_metering_3 , col = "blue" )
legend("topright",col=c("black","red","blue" ),lty=1, lwd=2, bty="n",legend = c("Sub_metering_1" , "Sub_metering_2" , "Sub_metering_3"))

dev.copy(png, file = "plot3.png")
dev.off()