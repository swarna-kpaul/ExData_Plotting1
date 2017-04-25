######## R code to read data from file"household_power_consumption.txt" and plot timeseries of Global_active_power for 1st 2 days of Feb 2007


### Read data from file
data<-read.table("household_power_consumption.txt", na.strings="?",sep = ";",header=TRUE)

##### Format Date time
data$Date=as.Date(data$Date,format="%d/%m/%Y")
data$datetime<-strptime(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S")

####### Filter data by date
data1<-data[data$Date %in% as.Date(c('2007-02-01','2007-02-02')),]

####### Draw line chart
plot(data1$datetime,data1$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)")

####### Write plot to png file
dev.copy(png,'plot2.png',width=480,height=480)
dev.off()