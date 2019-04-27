#code for plot 1
#***Before submission, add descriptoins, and remove # from return data so it works
mySetup<-function(){
  #loads the librarys used.
  library(data.table)
  library(lubridate)
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
  mydata$Global_active_power<<-as.numeric(mydata$Global_active_power)
}

plot1png<-function(){
  #exports the plot
  png("plot1.png", width=480, height=480)
  hist(returnData()$Global_active_power, col="Red", xlab="Global Active Power (kilowatts)", main="Global Active Power" )
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
plot1png()