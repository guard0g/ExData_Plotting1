#setwd("~/R/ExploratoryDataAnalysis/")
data<-read.table("household_power_consumption.txt",sep=";")

data$date <- as.Date(strptime(paste(data$V1,data$V2), format="%d/%m/%Y %H:%M:%S"))
mydata <- data[(data$date < as.Date("2007-02-03") & (data$date >= as.Date("2007-02-01"))),]
remove(data)


png(file="plot2.png",width=480,height=480,units="px")
plot(as.numeric(as.character(mydata$V3)),type="l",ylab="Global Active Power (kilowatts)",xlab="",xaxt="n")
axis(1,4,"Thu")
axis(1,1442,"Fri")
axis(1,2881,"Sat")
dev.off()
