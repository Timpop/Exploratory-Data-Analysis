download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile=paste0(getwd(),"/POWER.zip"),method="auto")
unzip(getwd(),file=paste0(getwd(),"POWER.zip"))
HOUSEP<-read.table(paste0(getwd(),"/household_power_consumption.txt"),header=T,sep=";",na.strings="?")
HOUSEP[,1]<-as.character(strptime(HOUSEP[,1],"%d/%m/%Y"))
T201202<-HOUSEP[(HOUSEP[,1] == "2007-02-02"|HOUSEP[,1] == "2007-02-01"),]

png(filename = "plot1.png",width = 480, height = 480)
with(T201202,hist(T201202[,3],col = "red", main="Global active power",xlab="Global active power (kilowatt)"))
dev.off()