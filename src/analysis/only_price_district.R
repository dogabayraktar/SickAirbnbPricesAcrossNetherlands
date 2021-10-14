library(tidyverse)

#---only_price_district main dataset for Analysis---#

# load in the complete price comparison between all six data set
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

