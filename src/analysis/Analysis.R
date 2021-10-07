
# load in the complete price comparion between all six data set
price_comparison <- read.csv('../../gen/temp/complete_price_comparison.csv')

# removing all columns unrelated to the price
only_prices <- price_comparison[,6:11]

# filtering each row that has no price changes and counting them
filter(only_prices ,duplicated(only_prices))
nrow(filter(only_prices ,duplicated(only_prices)))

# percentage of listings with no price change
percentage_no_price_change <- nrow(filter(only_prices ,duplicated(only_prices)))/nrow(price_comparison)

# sub-setting the price comparison to listings with prices that have a change
price_comparison_changed_prices  <- filter(price_comparison, !duplicated(only_prices))

#creating a new column with the price difference
#library(dplyr)
price_difference<-only_prices %>%
  group_by(price_12.20) %>%
  mutate(diff=price_05.21-lag(
    price_05.21,default=first(price_05.21)))