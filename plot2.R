##Plot 2

##Load data

#setwd("E:/BOKU_COURSES/R/coursera/exploratory_data_analysis/week_1")
epc<-read.table(file='household_power_consumption.txt',
                header=T,sep=';',na='?',colClasses=c('character','character',rep('numeric',7)))


##Subset the 2 days needed

epc_sub<-epc[epc$Date=="1/2/2007" | epc$Date=="2/2/2007",]
datestring<-paste(epc_sub$Date,epc_sub$Time)
epc_sub$DateTime<-strptime(datestring, "%d/%m/%Y %H:%M:%S" )
rownames(epc_sub)<-1:nrow(epc_sub)


##Plot 2

png(filename = "plot2.png", 
    width = 480, height = 480,
    units = "px")
plot(epc_sub$DateTime, epc_sub$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
