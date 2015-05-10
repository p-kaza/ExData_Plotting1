##Plot 4

##Load data

# setwd("E:/BOKU_COURSES/R/coursera/exploratory_data_analysis/week_1")
epc<-read.table(file='household_power_consumption.txt',
                header=T,sep=';',na='?',colClasses=c('character','character',rep('numeric',7)))


##Subset the 2 days needed

epc_sub<-epc[epc$Date=="1/2/2007" | epc$Date=="2/2/2007",]
datestring<-paste(epc_sub$Date,epc_sub$Time)
epc_sub$DateTime<-strptime(datestring, "%d/%m/%Y %H:%M:%S" )
rownames(epc_sub)<-1:nrow(epc_sub)

#Plot 4

png(filename = "plot4.png", 
    width = 480, height = 480,
    units = "px")
par(mfrow = c(2, 2))

## Top-left plot
plot(epc_sub$DateTime, epc_sub$Global_active_power, 
     type = "l",
     xlab = "", ylab = "Global Active Power")

## Top-right plot
plot(epc_sub$DateTime, epc_sub$Voltage,
     type = "l",
     xlab = "datetime", ylab = "Voltage")

## Bottom-left plot
plot(epc_sub$DateTime, epc_sub$Sub_metering_1, 
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(epc_sub$DateTime, epc_sub$Sub_metering_2, col = "red")
lines(epc_sub$DateTime, epc_sub$Sub_metering_3, col = "blue")

# Remove the border of legend here.
legend("topright", 
       bty = "n",
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)

## Bottom-right plot
plot(epc_sub$DateTime, epc_sub$Global_reactive_power, 
     type = "l",
     col = "black",
     xlab = "datetime", ylab = colnames(epc_sub)[4])
dev.off()
