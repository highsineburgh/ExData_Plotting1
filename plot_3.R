base_dir <- getwd()
source('get_data.R')
image_dir <- "imageDir"
if (file.exists(image_dir)) {
    setwd(file.path(base_dir, image_dir))
} else {
    dir.create(file.path(base_dir, image_dir))
    setwd(file.path(base_dir, image_dir))
}

png("plot3.png",width = 480, height = 480, units = "px", bg= "NA")
x <- power.csv$DateTime
y <- power.csv$Sub_metering_1
y2 <- power.csv$Sub_metering_2
y3 <- power.csv$Sub_metering_3
plot(x, y, type="n", xlab="", ylab="Energy sub metering")
lines(x,y)
lines(x, y2, col="red")
lines(x, y3, col="blue")
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=1)
dev.off()
setwd(base_dir)
