
setwd("/Users/dogabayraktar/Desktop/DPREP/SickAirbnbPricesAcrossNetherlands/gen/temp")
# load in the complete price comparion between all six data set
price_comparison <- read.csv('../../gen/temp/complete_price_comparison.csv')

# removing all columns unrelated to the price and district

only_price_district <- price_comparison%>%
  select(neighbourhood_cleansed,price_12.20,price_01.21,price_02.21,price_03.21,price_04.21,price_05.21)


# filtering each row that has no price changes and counting them
filter(only_price_district ,duplicated(only_price_district))
nrow(filter(only_price_district ,duplicated(only_price_district)))

# percentage of listings with no price change
percentage_no_price_change <- nrow(filter(only_price_district ,duplicated(only_price_district)))/nrow(price_comparison)

# sub-setting the price comparison to listings with prices that have a change
price_comparison_changed_prices  <- filter(price_comparison, !duplicated(only_price_district))


#creating a new column with the price difference
only_price_district$price_difference<-((only_price_district$price_05.21)-(only_price_district$price_12.20))

#---ANOVA Analysis---#
#transforming the price difference to absolute value to see the change only
only_price_district$abs_price_difference<-abs(((only_price_district$price_05.21)-(only_price_district$price_12.20)))

#median split for absolute price-change
only_price_district$abs_price_difference_high <- only_price_district$abs_price_difference>median(only_price_district$abs_price_difference)

#bar-plot for low vs high price difference
temp <- only_price_district %>% group_by(neighbourhood_cleansed,abs_price_difference) %>% summarize(price_difference_mean = mean(price_difference))
ggplot(temp, aes(x=abs_price_difference_high, y=price_difference_mean, fill=as.factor(neighbourhood_cleansed))) + geom_col(position="dodge")





