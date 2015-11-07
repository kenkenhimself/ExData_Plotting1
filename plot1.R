f <- file("household_power_consumption.txt")
b <- read.table(text = grep("^[1,2]/2/2007", readLines(f), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
hist(b$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")
fdata <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                                         na.strings = "?", nrows = 2075259, check.names = F, 
                                         stringsAsFactors = F, comment.char = "", quote = '\"')
fdata$Date <- as.Date(fdata$Date, format = "%d/%m/%Y")
data <- subset(fdata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(fdata)
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
dev.copy(png,'plot1.png')
dev.off()
