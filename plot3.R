df = read.table("household_power_consumption.txt",
                sep = ";",
                header = TRUE,
                na.strings = "?"
)

df$Date <- as.Date(df$Date,"%d/%m/%Y")

df1 <- subset(df, Date >= "2007-02-01" & Date <= "2007-02-02")
df1$DateTime <- as.POSIXct(paste(df1$Date, df1$Time), format="%Y-%m-%d %H:%M:%S")

plot(df1$DateTime,df1$Sub_metering_1,type = "n",xlab = "",ylab = "Energy sub metering")
lines(df1$DateTime,df1$Sub_metering_1,col="black")
lines(df1$DateTime,df1$Sub_metering_2,col="red")
lines(df1$DateTime,df1$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,col=c("black","red","blue"))

dev.print(png,"plot3.png",width=480,height=480)