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
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## Doing plot 3
png(file = "plot3.png", bg = "transparent", width = 480, height = 480)

#Change the locale to USA and the way that data appears in axis to show just the american week day names
Sys.setlocale("LC_ALL","C")
axis.Date(1, at = data$DateTime, labels = format(data$DateTime, "%a"))

## Plot without xlabel and with type equals to line
plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")

## Legend with appropriate symbols (lines)
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()

## Return locale to default value
Sys.setlocale("LC_ALL","")