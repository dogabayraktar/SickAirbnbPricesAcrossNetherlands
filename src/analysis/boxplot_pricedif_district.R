library(ggplot2)
library(ggpubr)

#--Box plot for price difference according to district--#

only_price_district <- read.csv('../../gen/temp/only_price_district.csv')

boxplot_pricedif_district<-ggboxplot(only_price_district, x = "neighbourhood_cleansed", y = "price_difference", 
                                     color = "neighbourhood_cleansed",
                                     ylab = "District", xlab = "Price difference")

