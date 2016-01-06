mydata <- read.table('household_power_consumption.txt', sep =';',skip=66637,nrow =2880) # read the rows for the specific dates
rL <- read.table('household_power_consumption.txt',header=TRUE, sep=';',nrow=1) # pick up header
names(mydata) <- names(rL) # apply header to data subset
#################################################
date_time <- as.POSIXct(paste(mydata$Date, mydata$Time), format="%d/%m/%Y %H:%M:%S") # combine date and time and convert to POSIXct
mydata$DateTime <- date_time  # add new column
mydata$Date <- NULL   # remove old date and time columns
mydata$Time <- NULL
#################################################
png(file="plot3.png",width=480,height=480)

plot(mydata$DateTime,mydata$Sub_metering_1,type='n', xlab='', ylab='Energy sub metering') # create the empty plot
lines(mydata$DateTime,mydata$Sub_metering_1, type ='l', col="black") # plot the three sub_meters
lines(mydata$DateTime,mydata$Sub_metering_2, type ='l', col="red")
lines(mydata$DateTime,mydata$Sub_metering_3, type ='l', col="blue")
legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3') ,  # add a legend
        lty=1,col=c('black', 'red', 'blue'))
#################################################
dev.off() 
