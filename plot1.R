## Plot 1 ##

# Set working directory in the folder where household_power_consumption.txt is located 
Power <- read.table("household_power_consumption.txt",header=TRUE,sep=";",quote="",  
                    stringsAsFactors=FALSE,comment.char="")

# Convert into Date
Power$Date <- as.Date(Power$Date , "%d/%m/%Y")

# Subset the dataset with the relevant time period
PowerSub <- Power[(Power$Date == as.Date("01/02/2007", "%d/%m/%Y") | Power$Date == as.Date("02/02/2007", "%d/%m/%Y") ),]
PowerSub[,3:9] <- sapply(PowerSub[,3:9] , as.numeric)

# Creation of the histogram

hist(PowerSub$Global_active_power , col ="red", main = "Global Active Power" , xlab = "Global Active Power (kilowatts)" )

# saving the plot into a PNG
dev.copy(png, file = "plot1.png")
dev.off()
