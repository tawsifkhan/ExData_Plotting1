df = read.table("household_power_consumption.txt",
                sep = ";",
                header = TRUE,
                na.strings = "?"
)

df$Date <- as.Date(df$Date,"%d/%m/%Y")
df1 <- subset(df, Date >= "2007-02-01" & Date <= "2007-02-02")
df1$DateTime <- as.POSIXct(paste(df1$Date, df1$Time), format="%Y-%m-%d %H:%M:%S")


par(mfrow=c(2,2))
par(mar=c(4,4,2,1))

plot(df1$DateTime,df1$Global_active_power,type="n",
     xlab = "",ylab = "Global Active Power")
lines(df1$DateTime,df1$Global_active_power)

plot(df1$DateTime,df1$Voltage,type="l",xlab = "datetime", ylab = "Voltage")

plot(df1$DateTime,df1$Sub_metering_1,type = "n",xlab = "",ylab = "Energy sub metering")
lines(df1$DateTime,df1$Sub_metering_1,col="black")
lines(df1$DateTime,df1$Sub_metering_2,col="red")
lines(df1$DateTime,df1$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,col=c("black","red","blue"))

plot(df1$DateTime,df1$Global_reactive_power,type="l",
     xlab = "datetime",ylab = "Global Reactive Power")

dev.print(png,"plot4.png",width=480,height=480)