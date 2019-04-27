#code for plot 3
#***Before submission, add descriptoins, and remove # from return data so it works
mySetup<-function(){
  #loads the librarys used.
  library(data.table)
  library(lubridate)
  library(dplyr)
}

dlFile<-function(){
  #Downloads the zip file to use.
  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
  unzip(temp)
  unlink(temp)
}

loadFile<-function(){
  #loads the file
  mydata <<- fread("household_power_consumption.txt",sep=";",header=TRUE)
}

cleanData<-function(){
  #Cleans up the data in prep for the plot
  mydata$Date <<- dmy(mydata$Date)
  mydata<<-subset(mydata, Date=="2007-02-01" | Date == "2007-02-02")
  
  mydata<<-mutate(mydata, datetime=ymd_hms(paste(mydata$Date, mydata$Time, sep="_")))
  
  mydata$Global_active_power<<-as.numeric(mydata$Global_active_power)
  mydata<<-mutate(mydata, dow=wday(Date, label=TRUE))
}

plot3png<-function(){
  #exports the plot
  png("plot3.png", width=480, height=480)
  plot(x=mydata$datetime, y=mydata$Sub_metering_1, type = "n", ylab="Enegry sub meeting", xlab="")
  points(x=mydata$datetime, y=mydata$Sub_metering_1, type = "l")
  points(x=mydata$datetime, y=mydata$Sub_metering_2, type = "l", col = "Red")
  points(x=mydata$datetime, y=mydata$Sub_metering_3, type = "l", col = "Blue")
  legend("topright", col=c("Black", "Red", "Blue"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)
  dev.off()
}

returnData<-function(){
  #returns the if needed for testing purposes
  return(mydata)
}

#calls the functions to do the work.
mySetup()
dlFile()
loadFile()
cleanData()
plot3png()