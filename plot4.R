#setwd("~/R/ExploratoryDataAnalysis/")
data<-read.table("household_power_consumption.txt",sep=";")

data$date <- as.Date(strptime(paste(data$V1,data$V2), format="%d/%m/%Y %H:%M:%S"))
datelist <- (data$date < as.Date("2007-02-03") & (data$date >= as.Date("2007-02-01")))
datelist[1] <- FALSE
mydata <- data[datelist,]
remove(data)


png(file="plot4.png",width=480,height=480,units="px")

par(mfrow=c(2,2))
plot(as.numeric(as.character(mydata$V3)),type="l",ylab="Global Active Power",xlab="",xaxt="n")
axis(1,4,"Thu")
axis(1,1442,"Fri")
axis(1,2881,"Sat")

plot(as.numeric(as.character(mydata$V5)),type="l",ylab="Voltage",xlab="datetime",xaxt="n")
axis(1,4,"Thu")
axis(1,1442,"Fri")
axis(1,2881,"Sat")


myout <- as.matrix(mydata[,7:9])
plot(as.numeric(as.character(mydata$V7)),type="l",ylab="Energy sub metering",xlab="",xaxt="n")
lines(as.numeric(as.character(mydata$V8)),col="Red")
lines(as.numeric(as.character(mydata$V9)),col="Blue")
axis(1,4,"Thu")
axis(1,1442,"Fri")
axis(1,2881,"Sat")
legend_names <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright",legend_names,col=c("Black","Red","Blue"),pch="_",bty="n")

plot(as.numeric(as.character(mydata$V4)),type="l",ylab="Global_reactive_power",xlab="datetime",xaxt="n")
axis(1,4,"Thu")
axis(1,1442,"Fri")
axis(1,2881,"Sat")
dev.off()
