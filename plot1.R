
setwd("D:\\DS\\exploratory data analysis")

#######readin the data and covernt the data and times variables
powerdata<-read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?", colClasses = c("character", "character" ,rep("numeric", 7)))
powerdata$Time<-strptime(paste(powerdata$Date,powerdata$Time), "%d/%m/%Y %H:%M:%S")
powerdata$Date<-as.Date(powerdata$Date,format = "%d/%m/%Y")

head(powerdata)

#######subset data to those in the time frames
subdata<-subset(powerdata, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))


###############plot 1#############
png("plot1.png",width = 480, height = 480, units = "px")
hist(subdata$Global_active_power, col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()
