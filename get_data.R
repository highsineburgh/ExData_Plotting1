# Download and unzip the file if it doesn't exist
if (!file.exists('power_consumption.zip')) {
    url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
    download.file(url, destfile='power_consumption.zip', method='curl')
    unzip('power_consumption.zip')
}

# Extract the dates we are interested in
library(sqldf)

#The SQL select statement
sql <- "SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007' ORDER BY Date, Time"
power <- "household_power_consumption.txt"
power.csv <- read.csv2.sql(power, sql)

# Combine the Date and Time fields
power.csv$DateTime <- paste(power.csv$Date, power.csv$Time, sep=" ")

# Convert the new DateTime field to a POSIXct object
power.csv$DateTime <- as.POSIXct(strptime(power.csv$DateTime, "%d/%m/%Y %H:%M:%S"))