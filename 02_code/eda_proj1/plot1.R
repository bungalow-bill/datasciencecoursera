# Coursera data science specialization 
# Exploratory data analysis project 
# DHC June 2014
# read in household power consumption data
infile<-'01_rawdata/household_power_consumption.txt'
class.types<-c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric')
test<-read.table(infile,header=TRUE,sep=';',colClasses=class.types,stringsAsFactors=FALSE,na.strings='?')
test$datetime<-strptime(paste(test$Date,test$Time),"%d/%m/%Y %H:%M:%OS")
test.sub<-test[test$Date %in% c('1/2/2007','2/2/2007'),]
# figure 1 - histogram of Global_active_power
png(file='plot1.png',width=480,height=480)
hist(test.sub$Global_active_power,col='red',main='Global Active Power',xlab='Global Active Power (kilowatts)')
dev.off()