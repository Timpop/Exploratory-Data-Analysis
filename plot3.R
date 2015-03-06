download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile=paste0(getwd(),"/POWER.zip"),method="auto")
unzip(getwd(),file=paste0(getwd(),"POWER.zip"))
HOUSEP<-read.table(paste0(getwd(),"/household_power_consumption.txt"),header=T,sep=";",na.strings="?")
HOUSEP[,1]<-as.character(strptime(HOUSEP[,1],"%d/%m/%Y"))
T201202<-HOUSEP[(HOUSEP[,1] == "2007-02-02"|HOUSEP[,1] == "2007-02-01"),]
T201202[,10]<-(paste(T201202[,1],T201202[,2],sep=" "))

dev.set()
png(filename = "plot3.png",width = 480, height = 480)
with(T201202,plot((as.POSIXct(T201202[,10],"%Y/%m/%d %H:%M:%S")),T201202[,7],type="l",xlab="",ylab="Energy sub metering"))
points((as.POSIXct(T201202[,10],"%Y/%m/%d %H:%M:%S")),T201202[,8],col="red",type="l")
points((as.POSIXct(T201202[,10],"%Y/%m/%d %H:%M:%S")),T201202[,9],col="blue",type="l")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),pch="_")
dev.off()
