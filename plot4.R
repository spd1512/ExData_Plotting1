#Loading the dataset

dataset <- 'household_power_consumption.txt'
data <- read.table(dataset , header = TRUE , sep = ';')
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- format(strptime(data$Time, "%H:%M:%S"),"%H:%M:%S")
feb <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]
feb$DateTime <- as.POSIXct(paste(feb$Date , feb$Time))

#Visualization

png(filename = "plot4.png" , width = 480 , height = 480 , units = "px")
par(mfrow = c(2,2))

plot(feb$DateTime , as.numeric(feb$Global_active_power) , type = "l" ,
     ylab = "Global Active Power (kilowatts)" , xlab=" ")

plot(feb$DateTime , as.numeric(feb$Voltage) , type = "l" ,
     ylab = "Voltage" , xlab="datetime")

with(feb, { plot(Sub_metering_1~DateTime,type="l",xlab="",ylab="Energy sub metering")
        lines(Sub_metering_2~DateTime,col='Red')
        lines(Sub_metering_3~DateTime,col='Blue')
})
legend("topright",lty=1, lwd=2, col = c("black", "red","blue"), 
       legend = c("sub_metering_1","sub_metering_2","sub_metering_3"))

plot(feb$DateTime , as.numeric(feb$Global_reactive_power) , type = "l" ,
     ylab = "Global_reactive_power" , xlab="datetime")

dev.off()
