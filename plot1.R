#setwd("~/R/ExploratoryDataAnalysis/")
data<-read.table("household_power_consumption.txt",sep=";")

data$date <- as.Date(data$V1, format="%d/%m/%Y")
mydata <- data[(data$date <= as.Date("2007-02-02")) & (data$date >= as.Date("2007-02-01")),]
remove(data)

png(file="plot1.png",width=480,height=480,units="px")
hist(as.numeric(as.character(mydata$V3)),main=paste("Global Active Power"),col="Red",xlab="Global Active Power (kilowatts)")
dev.off()
