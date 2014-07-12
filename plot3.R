#
# script for Exploratory Data Analysis project 1 plot 3
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
# Now do the plotting
png("./plot3.png",width=480,height=480)
# note that since I am reusing the plot the ylim must be set on each plot
plot(hpcsub$Datetime,hpcsub$Sub_metering_1,
     type="l",lwd=1,
     xlab="",ylab="Energy sub metering",
     ylim=c(0,max(hpcsub$Sub_metering_1)))
# Use the same plot
par(new=TRUE)
plot(hpcsub$Datetime,hpcsub$Sub_metering_2,
     type="l",lwd=1,
     xlab="",ylab="Energy sub metering",
     ylim=c(0,max(hpcsub$Sub_metering_1)),
     col="red")
# Use the same plot again
par(new=TRUE)
plot(hpcsub$Datetime,hpcsub$Sub_metering_3,
     type="l",lwd=1,
     xlab="",ylab="Energy sub metering",
     ylim=c(0,max(hpcsub$Sub_metering_1)),
     col="blue")
# Set the legend
legend("topright", lty = 1, 
       col = c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
#