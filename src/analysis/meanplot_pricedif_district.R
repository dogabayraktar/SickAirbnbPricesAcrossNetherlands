library(ggplot2)

# loading data set
only_price_district <- read.csv('../../gen/temp/only_price_district.csv')

#--Mean plot for only_price_district--#
ggline(only_price_district, x = "neighbourhood_cleansed", y = "price_difference",
       add = c("mean_se", "jitter"), 
       ylab = "District", xlab = "Price difference")