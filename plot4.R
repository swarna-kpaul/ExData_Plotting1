######## R code to read data from file"household_power_consumption.txt" and plot multiple statistics in one window for 1st 2 days of Feb 2007


### Read data from file
data<-read.table("household_power_consumption.txt", na.strings="?",sep = ";",header=TRUE)

##### Format Date time
data$Date=as.Date(data$Date,format="%d/%m/%Y")
data$datetime<-strptime(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S")

####### Filter data by date
data1<-data[data$Date %in% as.Date(c('2007-02-01','2007-02-02')),]

####### Draw 2x2 plots

par(mfrow=c(2,2))

plot(data1$datetime,data1$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(data1$datetime,data1$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(data1$datetime,data1$Sub_metering_1,type="l",col=1,xlab="",ylab="Energy Sub Metering")
lines(data1$datetime,data1$Sub_metering_2,col=2)
lines(data1$datetime,data1$Sub_metering_3,col=4)
legend("topright", legend =leg_list,col=c(1,2,4),lty=c(1,1),cex=1)
plot(data1$datetime,data1$Global_reactive_power,type="l",xlab="datetime",ylab="Global Reactive Power")


####### Write plot to png file
dev.copy(png,'plot3.png',width=480,height=480)
dev.off()