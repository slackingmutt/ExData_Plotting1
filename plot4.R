#
# script for Exploratory Data Analysis project 1 plot 4
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
png("./plot4.png",width=480,height=480)
# Set the display for 2 rows and two columns
par(mfrow=c(2,2))
# First plot in row 1 column 1
plot(hpcsub$Datetime,hpcsub$Global_active_power,
     type="l",lwd=1,
     xlab="",ylab="Global Active Power")
# Second plot in row 1 column 2
plot(hpcsub$Datetime, hpcsub$Voltage,
     type="l",lwd=1,
     xlab="datetime",ylab = "Voltage")
# Third plot in row 2 column 1; not that this plot must be reused
plot(hpcsub$Datetime,hpcsub$Sub_metering_1,
     type="l",lwd=1,
     xlab="",ylab="Energy sub metering",
     ylim=c(0,max(hpcsub$Sub_metering_1)))
par(new=TRUE)
plot(hpcsub$Datetime,hpcsub$Sub_metering_2,
     type="l",lwd=1,
     xlab="",ylab="Energy sub metering",
     ylim=c(0,max(hpcsub$Sub_metering_1)),
     col="red")
par(new=TRUE)
plot(hpcsub$Datetime,hpcsub$Sub_metering_3,
     type="l",lwd=1,
     xlab="",ylab="Energy sub metering",
     ylim=c(0,max(hpcsub$Sub_metering_1)),
     col="blue")
legend("topright", lty = 1, 
       col = c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# Now the plot in row 2 column 2
plot(hpcsub$Datetime,hpcsub$Global_reactive_power,
     type="l",lwd=1,
     xlab="datetime",ylab="Global_reactive_power")
dev.off()
#