######################
#### CLEAN DATA ######
######################

library(dplyr)
library(stringr)
#---listings-12.20 dataset---#
df12_20_unclean <- read.csv("../../data/listings-12.20.csv")
df12_20<-df12_20_unclean%>% select(
  id,
  host_id,
  neighbourhood_cleansed,
  room_type,
  price,
  number_of_reviews,
  last_review,
  reviews_per_month
)

# Cleaning the price column and transforming to numeric
df12_20 <- df12_20 %>%  
  mutate(price = str_remove_all(price, fixed("$"))) %>% 
  mutate(price = str_remove_all(string = price, pattern = fixed(","))) %>% 
  mutate(price = as.numeric(x = price))

# last_review as a date variable
df12_20 <- df12_20 %>%  
  mutate(last_review = as.Date(last_review))

# No duplicated rows
filter(df12_20, duplicated(df12_20)) 

#---listings-01.21 dataset---#
df01_21_unclean <- read.csv("../../data/listings-01.21.csv")
df01_21<-df01_21_unclean%>% select(
  id,
  host_id,
  neighbourhood_cleansed,
  room_type,
  price,
  number_of_reviews,
  last_review,
  reviews_per_month
)

# Cleaning the price column and transforming to numeric
df01_21 <- df01_21 %>%  
  mutate(price = str_remove_all(price, fixed("$"))) %>% 
  mutate(price = str_remove_all(string = price, pattern = fixed(","))) %>% 
  mutate(price = as.numeric(x = price))

# last_review as a date variable
df01_21 <- df01_21 %>%  
  mutate(last_review = as.Date(last_review))

# No duplicated rows
filter(df01_21, duplicated(df01_21)) 

# Merging both data sets
df_merged12.20_01.21 <- df12_20 %>% 
  inner_join(df01_21, by = c("id" = "id"))

# Saving the dataset
write.csv(df_merged12.20_01.21, "../../gen/temp/comp12.20-01.21.csv")

#---listings-02.21 dataset---#

df02_21_unclean <- read.csv("listings-02.21.csv")
df02_21<-df02_21_unclean%>% select(
  name,
  host_id,
  neighbourhood,
  room_type,
  price,
  number_of_reviews,
  last_review,
  reviews_per_month
)

#---listings-03.21 dataset---#

df03_21_unclean <- read.csv("listings-03.21.csv")
df03_21<-df03_21_unclean%>% select(
  name,
  host_id,
  neighbourhood,
  room_type,
  price,
  number_of_reviews,
  last_review,
  reviews_per_month
)

#---listings-04.21 dataset---#

df04_21_unclean <- read.csv("listings-04.21.csv")
df04_21<-df04_21_unclean%>% select(
  name,
  host_id,
  neighbourhood,
  room_type,
  price,
  number_of_reviews,
  last_review,
  reviews_per_month
)

#---listings-05.21 dataset---#

df05_21_unclean <- read.csv("listings-05.21.csv")
df05_21<-df05_21_unclean%>% select(
  name,
  host_id,
  neighbourhood,
  room_type,
  price,
  number_of_reviews,
  last_review,
  reviews_per_month
)





