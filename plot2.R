prepareData <- function() {
  cacheFile <- "plot_data.csv"
  fname <- "C:/Users/champ/Documents/exdata-data-household_power_consumption.zip"
  con <- unz(fname, "household_power_consumption.txt")
  tbl <- read.table(con, header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
  tbl <- tbl[(tbl$Date == "1/2/2007") | (tbl$Date == "2/2/2007"),]
  tbl$DateTime <- strptime(paste(tbl$Date, tbl$Time), "%d/%m/%Y %H:%M:%S")
  write.csv(tbl, cacheFile)
  tbl
}


doPlot2 <- function() {
  tbl <- prepareData()
  png(filename = "plot2.png", width = 480, height = 480, units = "px")
  plot(tbl$DateTime, tbl$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.off()
}

doPlot2()