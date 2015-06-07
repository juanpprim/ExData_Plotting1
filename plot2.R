
## Plot 2 ##

Power <- read.table("household_power_consumption.txt",header=TRUE,sep=";",quote="",  
                    stringsAsFactors=FALSE,comment.char="")

Power$Date <- as.Date(Power$Date , "%d/%m/%Y")

PowerSub <- Power[(Power$Date == as.Date("01/02/2007", "%d/%m/%Y") | Power$Date == as.Date("02/02/2007", "%d/%m/%Y") ),]
PowerSub[,3:9] <- sapply(PowerSub[,3:9] , as.numeric)
PowerSub$DateTime <- paste(PowerSub$Date , PowerSub$Time )
PowerSub$DateTime <- as.POSIXct(strptime (PowerSub$DateTime , "%Y-%m-%d %H:%M:%S"))

plot(PowerSub$DateTime , PowerSub$Global_active_power , type ="n", xlab =""  , ylab = "Global Active Power (kilowatts)" )
lines(PowerSub$DateTime , PowerSub$Global_active_power )

dev.copy(png, file = "plot2.png")
dev.off()