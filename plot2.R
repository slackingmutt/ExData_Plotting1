#
# script for Exploratory Data Analysis project 1 plot 2
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
# Convert the date and time columns to POSIXct form
# Paste the columns together; call strptime; name the new column;
# cbind into the hpcsub data frame
datetime <- data.frame(strptime(paste(hpcsub$Date,hpcsub$Time),"%d/%m/%Y %H:%M:%S"))
names(datetime) <- "Datetime"
hpcsub <- cbind(hpcsub,datetime)
#
# Now plot the graph
png("./plot2.png",width=480,height=480)
plot(hpcsub$Datetime,hpcsub$Global_active_power,
     type="l", lwd =1,
     xlab="",ylab="Global Active Power (kilowatts")
dev.off()
#