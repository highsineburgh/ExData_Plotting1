base_dir <- getwd()
source('get_data.R')
image_dir <- "imageDir"
if (file.exists(image_dir)) {
    setwd(file.path(base_dir, image_dir))
} else {
    dir.create(file.path(base_dir, image_dir))
    setwd(file.path(base_dir, image_dir))
}

png("plot4.png",width = 480, height = 480, units = "px", bg= "NA")
par(mfcol = c(2,2))
x <- power.csv$DateTime
gap <- power.csv$Global_active_power

plot(x, gap, type="n", xlab="", ylab="Global Active Power")
lines(x, gap)
y <- power.csv$Sub_metering_1
y2 <- power.csv$Sub_metering_2
y3 <- power.csv$Sub_metering_3
plot(x, y, type="n", xlab="", ylab="Energy sub metering")
lines(x,y)
lines(x, y2, col="red")
lines(x, y3, col="blue")
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), 
       lty=1, bty="n")
voltage <- power.csv$Voltage
plot(x, voltage, xlab="datetime", ylab="Voltage", type="n")
lines(x, voltage)

grp <- power.csv$Global_reactive_power
plot(x, grp, xlab="datetime", ylab="Global_reactive_power", type="n")
lines(x, grp)
dev.off()
setwd(base_dir)
