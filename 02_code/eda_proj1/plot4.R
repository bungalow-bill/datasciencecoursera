# Coursera data science specialization 
# Exploratory data analysis project 
# DHC June 2014
# read in household power consumption data
infile<-'01_rawdata/household_power_consumption.txt'
class.types<-c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric')
test<-read.table(infile,header=TRUE,sep=';',colClasses=class.types,stringsAsFactors=FALSE,na.strings='?')
test$datetime<-strptime(paste(test$Date,test$Time),"%d/%m/%Y %H:%M:%OS")
test.sub<-test[test$Date %in% c('1/2/2007','2/2/2007'),]
# figure 4 - array of four charts
png(file='plot4.png',width=480,height=480)
par(mfrow=c(2,2))
# upper left, time series of global active power
plot(test.sub$datetime,test.sub$Global_active_power,type='l',main='',xlab='',ylab='Global Active Power')
# upper right, time series of voltage
plot(test.sub$datetime,test.sub$Voltage,type='l',main='',xlab='datetime',ylab='Voltage')
# lower left, time series of sub metering values
plot(test.sub$datetime,test.sub$Sub_metering_1,type='l',main='',xlab='',ylab='Energy sub setering')
lines(test.sub$datetime,test.sub$Sub_metering_2,type='l',col='red',main='',xlab='',ylab='')
lines(test.sub$datetime,test.sub$Sub_metering_3,type='l',col='blue',main='',xlab='',ylab='')
legend("topright",legend=names(test.sub)[7:9],col=c('black','red','blue'),lty=1,bty='n')
# lower right, time series of global reactive power
plot(test.sub$datetime,test.sub$Global_reactive_power,type='l',main='',xlab='datetime',ylab='Global_reactive_power')
dev.off()