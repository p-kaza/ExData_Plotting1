##Plot 1

##Load data

#setwd("E:/BOKU_COURSES/R/coursera/exploratory_data_analysis/week_1")
epc<-read.table(file='household_power_consumption.txt',
                header=T,sep=';',na='?',colClasses=c('character','character',rep('numeric',7)))


##Subset the 2 days needed

epc_sub<-epc[epc$Date=="1/2/2007" | epc$Date=="2/2/2007",]
datestring<-paste(epc_sub$Date,epc_sub$Time)
epc_sub$DateTime<-strptime(datestring, "%d/%m/%Y %H:%M:%S" )
rownames(epc_sub)<-1:nrow(epc_sub)


#Plot 1

png(filename = "plot1.png",width = 480, height = 480, 
    units = "px")
hist(epc_sub$Global_active_power,col='red',breaks=12,xlab="Global Active Power (kilowatts)",
     ylim=c(0,1200),main="Global Active Power")
dev.off()