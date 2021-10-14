library(ggpubr)
library(ggplot2)

#--Box plot for price difference according to district--#

boxplot_pricedif_district<-ggboxplot(only_price_district, x = "neighbourhood_cleansed", y = "price_difference", 
                                     color = "neighbourhood_cleansed",
                                     ylab = "District", xlab = "Price difference")
