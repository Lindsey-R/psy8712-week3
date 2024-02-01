# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Data Import and Cleaning
raw_df <- read.csv(file = "../data/week3.csv", header = TRUE) #use../ to go back to the psy8712-week3 directory
raw_df$timeStart <- as.POSIXct(raw_df$timeStart, format = "%Y-%m-%d %H:%M:%S")
raw_df$timeEnd <- as.POSIXct(raw_df$timeEnd, format = "%Y-%m-%d %H:%M:%S")
clean_df <- raw_df[raw_df$timeStart >= "2017-07-01 00:00:00", ]
clean_df <- clean_df[clean_df$q6 == 1, ]

#Analysis
clean_df$timeSpent <- difftime(time1 = clean_df$timeEnd, time2 = clean_df$timeStart, units = "secs")
hist(as.numeric(clean_df$timeSpent))
frequency_tables_list <- lapply(clean_df[ ,5:14], table)
lapply(frequency_tables_list, barplot)
nrow(clean_df[clean_df$q1 >= clean_df$q2 & clean_df$q2 != clean_df$q3, ])
for (i in frequency_tables_list){
  barplot(i)} 
