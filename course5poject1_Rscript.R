
# script for Course 5, week 2, project

rm(list = ls())

df <- read.csv("activity.csv")

library(dplyr)
library(lubridate)
library(ggplot2)

df$date <- ymd(df$date)

df2 <- df %>%
group_by(date) %>%
summarize(sum_step_day = sum(steps, na.rm = T))

graphics.off()

windows()

hist(df2$sum_step_day, xlab = "number of steps in a day", 
     ylab = "count", breaks = 10, col = "gray", main = "Histogram")

mean(df2$sum_step_day, na.rm = T)
median(df2$sum_step_day, na.rm = F)

stop()

df3 <- df %>%
group_by(interval) %>%
summarize(avg_step_intval = mean(steps, na.rm = T))

df$interval_id <- rep(1:288, length.out = nrow(df))

number_of_nas <- sum(is.na(df$steps))

na_idx <- which(is.na(df$steps))

na_int_idx <- df$interval_id[na_idx]

df$steps[na_idx] <- df3$avg_step_intval[na_int_idx]

# 
# hist(sum_step_day, data = df2, binwidth = 5e3, ylab = "number of steps 
#       in a day")
