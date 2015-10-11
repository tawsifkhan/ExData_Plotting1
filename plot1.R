df = read.table("household_power_consumption.txt",
                sep = ";",
                header = TRUE,
                na.strings = "?"
                )

df$Date <- as.Date(df$Date,"%d/%m/%Y")

df1 <- subset(df, Date >= "2007-02-01" & Date <= "2007-02-02")

hist((df1$Global_active_power), main = "Global Active Power", 
     xlab = "Global Active Power (killowatts)",
     col ='red',breaks=20)

dev.print(png,"plot1.png",width=480,height=480)