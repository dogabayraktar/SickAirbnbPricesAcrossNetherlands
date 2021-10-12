######################
#### CLEAN DATA ######
######################

# creating gen/temp directory
dir.create('../../gen')
dir.create('../../gen/temp')

library(dplyr)
library(stringr)

##################---listings-12.20 dataset---##################
df12_20_unclean <- read.csv(gzfile('../../data/listings-12.20.csv.gz'), as.is = TRUE) 
df12_20<-df12_20_unclean%>% select(
  id,
  host_id,
  neighbourhood_cleansed,
  room_type,
  price,
)

# Cleaning the price column and transforming it to numeric
df12_20 <- df12_20 %>%  
  mutate(price = str_remove_all(price, fixed("$"))) %>% 
  mutate(price = str_remove_all(string = price, pattern = fixed(","))) %>% 
  mutate(price_12.20 = as.numeric(x = price)) %>% 
  select(-c(price))

  
# No duplicated rows
filter(df12_20, duplicated(df12_20)) 

##################---listings-01.21 dataset---##################
df01_21_unclean <- read.csv(gzfile('../../data/listings-01.21.csv.gz'), as.is = TRUE) 
df01_21<-df01_21_unclean%>% select(
  id,
  price,
)

# Cleaning the price column and transforming to numeric
df01_21 <- df01_21 %>%  
  mutate(price = str_remove_all(price, fixed("$"))) %>% 
  mutate(price = str_remove_all(string = price, pattern = fixed(","))) %>% 
  mutate(price_01.21 = as.numeric(x = price)) %>% 
  select(-c(price))

# No duplicated rows
filter(df01_21, duplicated(df01_21)) 


##################---listings-02.21 dataset---##################

df02_21_unclean <- read.csv(gzfile('../../data/listings-02.21.csv.gz'), as.is = TRUE)
df02_21<-df02_21_unclean%>% select(
  id,
  price,
)

# Cleaning the price column and transforming it to numeric
df02_21 <- df02_21 %>%  
  mutate(price = str_remove_all(price, fixed("$"))) %>% 
  mutate(price = str_remove_all(string = price, pattern = fixed(","))) %>% 
  mutate(price_02.21 = as.numeric(x = price)) %>% 
  select(-c(price))

# No duplicated rows
filter(df02_21, duplicated(df02_21)) 

##################---listings-03.21 dataset---##################

df03_21_unclean <- read.csv(gzfile('../../data/listings-03.21.csv.gz'), as.is = TRUE)
df03_21<-df03_21_unclean%>% select(
  id,
  price,
)

# Cleaning the price column and transforming it to numeric
df03_21 <- df03_21 %>%  
  mutate(price = str_remove_all(price, fixed("$"))) %>% 
  mutate(price = str_remove_all(string = price, pattern = fixed(","))) %>% 
  mutate(price_03.21 = as.numeric(x = price)) %>% 
  select(-c(price))

# No duplicated rows
filter(df03_21, duplicated(df03_21)) 

##################---listings-04.21 dataset---##################

df04_21_unclean <- read.csv(gzfile('../../data/listings-04.21.csv.gz'), as.is = TRUE)
df04_21<-df04_21_unclean%>% select(
  id,
  price,
)

# Cleaning the price column and transforming it to numeric
df04_21 <- df04_21 %>%  
  mutate(price = str_remove_all(price, fixed("$"))) %>% 
  mutate(price = str_remove_all(string = price, pattern = fixed(","))) %>% 
  mutate(price_04.21 = as.numeric(x = price)) %>% 
  select(-c(price))

# No duplicated rows
filter(df04_21, duplicated(df04_21)) 

##################---listings-05.21 dataset---##################

df05_21_unclean <- read.csv(gzfile('../../data/listings-05.21.csv.gz'), as.is = TRUE)
df05_21<-df05_21_unclean%>% select(
  id,
  price,
)

# Cleaning the price column and transforming it to numeric
df05_21 <- df05_21 %>%  
  mutate(price = str_remove_all(price, fixed("$"))) %>% 
  mutate(price = str_remove_all(string = price, pattern = fixed(","))) %>% 
  mutate(price_05.21 = as.numeric(x = price)) %>% 
  select(-c(price))

# No duplicated rows
filter(df05_21, duplicated(df05_21)) 

##################---Merging all data sets---##################
df_merged12.20_01.21 <- df12_20 %>% 
  inner_join(df01_21, by = c("id" = "id"))
  
fase1 <- df_merged12.20_01.21 %>% 
  inner_join(df02_21, by = c("id" = "id"))

fase2 <- fase1 %>% 
  inner_join(df03_21, by = c("id" = "id"))

fase3 <- fase2 %>% 
  inner_join(df04_21, by = c("id" = "id"))

complete_price_comparison <- fase3 %>% 
  inner_join(df05_21, by = c("id" = "id"))

#change variable names according to districts in Amsterdam
complete_price_comparison$neighbourhood_cleansed[complete_price_comparison$neighbourhood_cleansed == "Centrum-Oost"] <- "Amsterdam_Center"
complete_price_comparison$neighbourhood_cleansed[complete_price_comparison$neighbourhood_cleansed == "Centrum-West"] <- "Amsterdam_Center"
complete_price_comparison$neighbourhood_cleansed[complete_price_comparison$neighbourhood_cleansed == "Bos en Lommer"] <- "Amsterdam_West"
complete_price_comparison$neighbourhood_cleansed[complete_price_comparison$neighbourhood_cleansed == "De Baarsjes - Oud-West"] <- "Amsterdam_West"
complete_price_comparison$neighbourhood_cleansed[complete_price_comparison$neighbourhood_cleansed == "Westerpark"] <- "Amsterdam_West"
complete_price_comparison$neighbourhood_cleansed[complete_price_comparison$neighbourhood_cleansed == "IJburg - Zeeburgereiland"] <- "Amsterdam_Oost"
complete_price_comparison$neighbourhood_cleansed[complete_price_comparison$neighbourhood_cleansed == "Oostelijk Havengebied - Indische Buurt"] <- "Amsterdam_Oost"
complete_price_comparison$neighbourhood_cleansed[complete_price_comparison$neighbourhood_cleansed == "Watergraafsmeer"] <- "Amsterdam_Oost"
complete_price_comparison$neighbourhood_cleansed[complete_price_comparison$neighbourhood_cleansed == "Noord-Oost"] <- "Amsterdam_Noord"
complete_price_comparison$neighbourhood_cleansed[complete_price_comparison$neighbourhood_cleansed == "Noord-West"] <- "Amsterdam_Noord"
complete_price_comparison$neighbourhood_cleansed[complete_price_comparison$neighbourhood_cleansed == "Buitenveldert - Zuidas"] <- "Amsterdam_Zuid"
complete_price_comparison$neighbourhood_cleansed[complete_price_comparison$neighbourhood_cleansed == "De Pijp - Rivierenbuurt"] <- "Amsterdam_Zuid"
complete_price_comparison$neighbourhood_cleansed[complete_price_comparison$neighbourhood_cleansed == "Zuid"] <- "Amsterdam_Zuid"
complete_price_comparison$neighbourhood_cleansed[complete_price_comparison$neighbourhood_cleansed == "De Aker- Nieuw Sloten"] <- "Amsterdam_Nieuw_west"
complete_price_comparison$neighbourhood_cleansed[complete_price_comparison$neighbourhood_cleansed == "Geuzenveld - Slotermeer"] <- "Amsterdam_Nieuw_west"
complete_price_comparison$neighbourhood_cleansed[complete_price_comparison$neighbourhood_cleansed == "Osdorp"] <- "Amsterdam_Nieuw_west"
complete_price_comparison$neighbourhood_cleansed[complete_price_comparison$neighbourhood_cleansed == "Slotervaart"] <- "Amsterdam_Nieuw_west"
complete_price_comparison$neighbourhood_cleansed[complete_price_comparison$neighbourhood_cleansed == "Bijlmer-Centrum"] <- "Amsterdam_Zuidoost"
complete_price_comparison$neighbourhood_cleansed[complete_price_comparison$neighbourhood_cleansed == "Bijlmer-Oost"] <- "Amsterdam_Zuidoost"
complete_price_comparison$neighbourhood_cleansed[complete_price_comparison$neighbourhood_cleansed == "Gaasperdam - Driemond"] <- "Amsterdam_Zuidoost"
complete_price_comparison$neighbourhood_cleansed[complete_price_comparison$neighbourhood_cleansed == "Oud-Oost"] <- "Amsterdam_Oost"
complete_price_comparison$neighbourhood_cleansed[complete_price_comparison$neighbourhood_cleansed == "Oud-Noord"] <- "Amsterdam_Noord"
complete_price_comparison$neighbourhood_cleansed[complete_price_comparison$neighbourhood_cleansed == "De Aker - Nieuw Sloten"] <- "Amsterdam_Nieuw_west" 


#writing the CSV file
write.csv(complete_price_comparison, "../../gen/temp/complete_price_comparison.csv")
