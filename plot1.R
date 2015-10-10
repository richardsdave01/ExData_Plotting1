# Exploratory Data Analysis  -- Project 1
## Loading the data
#  Download and unzip file, read into R
library(lubridate)
temp <- tempfile()
url1 <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url1, temp)
if(!file.exists("~/R/ExData/Proj1")) {dir.create("~/R/ExData/Proj1")}
setwd("~/R/ExData/Proj1")
p1data <- read.table(unz(temp, "household_power_consumption.txt"), header = TRUE, 
                     sep = ";", stringsAsFactors = FALSE, na.strings = c("?", ""))
unlink(temp)
# select data from Feb. 1 and Feb. 2, 2007
p1 <- p1data[p1data$Date == "1/2/2007" | p1data$Date == "2/2/2007", ]
# reformat date/time
p1$datetime <- dmy_hms(paste(p1$Date, p1$Time))
# remove raw data from environment
remove(p1data)

# create Plot 1
png("plot1.png", 480, 480, units = "px")
hist(p1$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.off()
