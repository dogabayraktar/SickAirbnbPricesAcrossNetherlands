library(tidyverse)

#---only_price_district main dataset for Analysis---#

# load in the complete price comparison between all six data set
price_comparison <- read.csv('../../gen/temp/complete_price_comparison.csv')

# removing all columns unrelated to the price and district
only_price_district <- price_comparison %>%
  select(neighbourhood_cleansed,price_12.20,price_01.21,price_02.21,price_03.21,price_04.21,price_05.21)

#creating a new column with the price difference
only_price_district$price_difference<-((only_price_district$price_05.21)-(only_price_district$price_12.20))

# writing a temporary file
write.csv(only_price_district, "../../gen/temp/only_price_district.csv")

