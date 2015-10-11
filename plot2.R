df = read.table("household_power_consumption.txt",
                sep = ";",
                header = TRUE,
                na.strings = "?"
)

df$Date <- as.Date(df$Date,"%d/%m/%Y")
df1 <- subset(df, Date >= "2007-02-01" & Date <= "2007-02-02")
df1$DateTime <- as.POSIXct(paste(df1$Date, df1$Time), format="%Y-%m-%d %H:%M:%S")
plot(df1$DateTime,df1$Global_active_power,type="n",
     xlab = "",ylab = "Global Active Power (kilowatts)")
lines(df1$DateTime,df1$Global_active_power)

dev.print(png,"plot2.png",width=480,height=480)