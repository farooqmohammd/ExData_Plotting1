# Reading power consumption data
file <- read.table (file = 'household_power_consumption.txt' , header = TRUE , sep =';', na.strings = '?')
str(file)

# Selecting only required rows
power <- subset(x = file, Date == '1/2/2007' | Date == '2/2/2007')

# converting Date and Time variables to date/time class
power$Date<- as.Date(power$Date, format = "%d/%m/%Y" )
power$Time<-strptime(power$Time,format = '%H:%M:%S')
power[1:1440,"Time"] <- format(power[1:1440,"Time"], '2007-02-01 %H:%M:%S')
power[1441:2880,"Time"] <- format(power[1441:2880,"Time"], '2007-02-02 %H:%M:%S')
summary(power)


#calling png function and plotting the histogram
png(file='plot2.png', width = 480,height = 480)
plot(power$Time, power$Global_active_power,type='l', main="Global Active Power",ylab="Global Active Power(kilowatts)")
dev.off()
