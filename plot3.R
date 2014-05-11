setwd("D:\\DS\\exploratory data analysis")

#######readin the data and covernt the data and times variables
powerdata<-read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?", colClasses = c("character", "character" ,rep("numeric", 7)))
powerdata$Time<-strptime(paste(powerdata$Date,powerdata$Time), "%d/%m/%Y %H:%M:%S")
powerdata$Date<-as.Date(powerdata$Date,format = "%d/%m/%Y")

head(powerdata)

#######subset data to those in the time frames
subdata<-subset(powerdata, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))


###############plot 3#############
png("plot3.png",width = 480, height = 480, units = "px")
plot(subdata$Time, subdata$Sub_metering_1, type="l",xlab="", ylab="Energy Sub Metering")
lines(subdata$Time,subdata$Sub_metering_2, col="red")
lines(subdata$Time,subdata$Sub_metering_3, col="blue")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1,col=c("black","red","blue")) 
dev.off()
