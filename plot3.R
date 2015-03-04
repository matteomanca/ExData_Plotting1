
df <- read.csv("household_power_consumption.txt", header=TRUE, na.strings="?",sep=";")

sub_df <- df[which(as.Date(df$Date,  "%d/%m/%Y" )==as.Date("1/2/2007", "%d/%m/%Y" ) | as.Date(df$Date, "%d/%m/%Y")==as.Date("2/2/2007", "%d/%m/%Y")), ]

png(filename="plot3.png", width = 480, height = 480)

Sys.setlocale("LC_TIME", "en_US.UTF-8")     

colors <- c("black", "red","blue")

plot(sub_df$Sub_metering_1,  type="n",  
     ylim=range(sub_df$Sub_metering_1),           
     axes=F, ann=T,      
     ylab="Energy sub metering",xlab="", cex.lab=1, lwd=1)


lines(sub_df$Sub_metering_1 , type="l", lwd=1,
       col=colors[1]) 
lines(sub_df$Sub_metering_2 , type="l", lwd=1,
      col=colors[2]) 
lines(sub_df$Sub_metering_3 , type="l", lwd=1,
      col=colors[3]) 


sample_first_day <- nrow(sub_df[which(as.Date(sub_df$Date,  "%d/%m/%Y" )==as.Date("1/2/2007", "%d/%m/%Y" ) ),] ) #number of misurements first day
sample_second_day <- nrow(sub_df[which(as.Date(sub_df$Date,  "%d/%m/%Y" )==as.Date("2/2/2007", "%d/%m/%Y" ) ),] ) #number of misurements second day

dates <- seq(as.Date("1/2/2007", format = "%d/%m/%Y"),by = "days", length = 3) #sequence of date from 1/2/2007 to 3/2/2007
days = weekdays(as.Date( dates,'%d/%m/%Y'), abbreviate = TRUE) #get the week day from dates

axis(1, lab=F ,at=c(0,sample_first_day,sample_first_day + sample_second_day))  ###### create x axis specifying the number and position of ticks    

text(c(0,sample_first_day,sample_first_day + sample_second_day), par("usr")[3] - 2,   #### set label on x axis; par("usr")[3] - 1 specifies the distance of labels from axis
        adj=1,
        labels=days,
        xpd=T, cex=1, offset = 1)

axis(2, las=1, cex.axis=0.8)

# Create box around plot
box()

legend("topright", col = colors, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1)

#close file
dev.off()

