# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Data Import and Cleaning
raw_df <- read.csv(file = "../data/week3.csv", header = TRUE)
raw_df$timeStart <- as.POSIXct(raw_df$timeStart, format = "%Y-%m-%d %H:%M:%S")
raw_df$timeEnd <- as.POSIXct(raw_df$timeEnd, format = "%Y-%m-%d %H:%M:%S")
clean_df <- raw_df[raw_df$timeStart >= "2017-07-01 00:00:00", ]
clean_df <- clean_df[clean_df$q6 == 1, ]
