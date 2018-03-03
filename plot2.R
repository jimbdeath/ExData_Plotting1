setwd("C:/Users/jimbd/Nextcloud/R/Coursera")
dataall <- read.csv("household_power_consumption.txt", 
                    header=T, 
                     sep=';', 
                     na.strings="?", 
                     nrows=2075259, 
                     check.names=F, 
                     stringsAsFactors=F, 
                     comment.char="", 
                     quote='\"')

data <- subset(dataall, Date %in% c("1/2/2007","2/2/2007"))
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

with(data, {
  plot(Global_active_power~Datetime, 
       type="l",
       ylab="Global Active Power (kilowatts)", 
       xlab="")
})

dev.copy(png,'plot2.png',width=480, height=480)

dev.off()

