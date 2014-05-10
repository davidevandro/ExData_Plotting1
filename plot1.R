## Reading data

## 2 days, each day with 1440 minutes
nRowRead <-  2*1440

## 6 hours and 36 minutes (in 16th) + 31 - 17 + 1 = 15 days in Dec,
## 31 days in Jan, each with 1440 minutes + one line to header
nRowSkip <- 6*60 + 36 + 46*1440 + 1


## Cache the column names
colNames <- names(read.table("household_power_consumption.txt", sep = ";", nrows = 1, header = TRUE))

## Read data
data <- read.table("household_power_consumption.txt", sep = ";", nrows = nRowRead, skip = nRowSkip)
names(data) <- colNames
data$Date <- strptime(data$Date, "%d/%m/%Y")
data$Time <- strptime(data$Time, "%H:%M:%S")


## Doing plot 1
png(file = "plot1.png", bg = "transparent", width = 480, height = 480)
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
