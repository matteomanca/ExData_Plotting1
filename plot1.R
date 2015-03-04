
df <- read.csv("household_power_consumption.txt", header=TRUE, na.strings="?",sep=";")

sub_df <- df[which(as.Date(df$Date,  "%d/%m/%Y" )==as.Date("1/2/2007", "%d/%m/%Y" ) | as.Date(df$Date, "%d/%m/%Y")==as.Date("2/2/2007", "%d/%m/%Y")), ]

png(filename="plot1.png", width = 480, height = 480)
hist(sub_df$Global_active_power, col="red", xlab = "Global Active Power (Kilowatts)", 
     main="Global Active Power" , ylim = c(0,1200), cex.axis=0.8)
dev.off()


