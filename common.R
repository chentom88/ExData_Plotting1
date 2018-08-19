library("sqldf")
library("dplyr")
library("lubridate")

# function to get data for plotting
get_data <- function() {
    file_name <- "household_power_consumption.txt"
    
    # download file if necessary
    if (!file.exists(file_name)) {
        file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(file_url, "dataset.zip")
        unzip("dataset.zip")
    }
    
    data <- read.csv.sql(file_name, 
                 "select * from file where Date='1/2/2007' or Date='2/2/2007'",
                 sep=";")
    
    data %>%
        mutate(datetime=paste(Date, Time)) %>%
        mutate(datetime=as.POSIXct(parse_date_time(datetime, "dmy HMS", tz="UTC")))
}
