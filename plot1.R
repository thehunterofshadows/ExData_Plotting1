#code for plot 1
#***Before submission, add descriptoins, and remove # from return data so it works
mySetup<-function(){
  library(data.table)
  library(lubridate)
  library(dplyr)
}

dlFile<-function(){
  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
  unzip(temp)
  unlink(temp)
}

loadFile<-function(){
  mydata <<- fread("household_power_consumption.txt",sep=";",header=TRUE)
}

cleanData<-function(){
  #Here we will remove all but the dates we need
  mydata$Date <<- dmy(my$Date)
  mydata<<-subset(mydata, Date=="2007-02-01" | Date == "2007-02-02")
  mydata$Global_active_power<<-as.numeric(mydata$Global_active_power)
}

returnData<-function(){
  #mySetup()
  #dfFile()
  loadFile()
  return(mydata)
}