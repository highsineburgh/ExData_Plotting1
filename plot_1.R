base_dir <- getwd()
source('get_data.R')
image_dir <- "imageDir"
if (file.exists(image_dir)) {
    setwd(file.path(base_dir, image_dir))
} else {
    dir.create(file.path(base_dir, image_dir))
    setwd(file.path(base_dir, image_dir))
}

png("plot1.png",width = 480, height = 480, units = "px", bg= "NA")
hist(power.csv$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="orangered")
dev.off()
setwd(base_dir)