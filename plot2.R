mydata <- read.table('household_power_consumption.txt', sep =';',skip=66637,nrow =2880) # read the rows for the specific dates
rL <- read.table('household_power_consumption.txt',header=TRUE, sep=';',nrow=1) # pick up header
names(mydata) <- names(rL) # apply header to data subset
#################################################
date_time <- as.POSIXct(paste(mydata$Date, mydata$Time), format="%d/%m/%Y %H:%M:%S") # combine date and time and convert to POSIXct
mydata$DateTime <- date_time  # add new column
mydata$Date <- NULL   # remove old date and time columns
mydata$Time <- NULL
#################################################
png(file="plot2.png",width=480,height=480)
plot(mydata$DateTime,mydata$Global_active_power,type='n', xlab='', ylab='Global active power (kilowatts)')
lines(mydata$DateTime,mydata$Global_active_power, type ='l')
dev.off()
