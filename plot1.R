#Loading the dataset

dataset <- 'household_power_consumption.txt'
data <- read.table(dataset , header = TRUE , sep = ';')
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- format(strptime(data$Time, "%H:%M:%S"),"%H:%M:%S")
feb <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]

#Visualization

png(filename = "plot1.png" , width = 480 , height = 480 , units = "px")
hist(as.numeric(feb$Global_active_power) , main = "Global Active Power" , col = "red" ,
     xlab = "Global Active Power (kilowatts)")
dev.off()

