mydata <- read.table('household_power_consumption.txt', sep =';',skip=66637,nrow =2880) # read the rows for the specific dates
mydata[1] <- lapply(mydata[1],as.Date, format='%d/%m/%Y') # change the format of the date column
rL <- read.table('household_power_consumption.txt',header=TRUE, sep=';',nrow=1) # pick up header
names(mydata) <- names(rL) # apply header to data subset
#################################################
png(file="plot1.png",width=480,height=480)
hist(mydata$Global_active_power, breaks=12, col="red", main='Global Active Power', 
     xlab ='Global Active Power (kilowatts)')
dev.off()