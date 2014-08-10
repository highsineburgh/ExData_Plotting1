base_dir <- getwd()
source('get_data.R')
image_dir <- "imageDir"
if (file.exists(image_dir)) {
    setwd(file.path(base_dir, image_dir))
} else {
    dir.create(file.path(base_dir, image_dir))
    setwd(file.path(base_dir, image_dir))
}

png("plot2.png",width = 480, height = 480, units = "px", bg= "NA")
x <- power.csv$DateTime
y <- power.csv$Global_active_power
plot(x, y, type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(x,y)
dev.off()
setwd(base_dir)
