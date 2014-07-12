#
# script for Exploratory Data Analysis project 1 plot 1
# 
# read the file; note the assumption on the working directory
hpc <- read.table("./household_power_consumption.txt",
                  header=TRUE,
                  sep=";",
                  na.strings ="?",
                  stringsAsFactors=FALSE)
#
# subset the file
hpcsub <- subset(hpc,Date == "1/2/2007" | Date == "2/2/2007")
#
# plot the histogram
# 
# open the device
png("./plot1.png",width=480,height=480)
# construct the histogram
hist(as.numeric(hpcsub$Global_active_power), 
     col = "red", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", 
     main = "Global Active Power",xlim = c(0,6))
# 
# close the device
dev.off()
#
