
listings_12.20<- read.csv("listings-12.20.csv")
listings_01.21<- read.csv("listings-01.21.csv")
listings_02.21<- read.csv("listings-02.21.csv")
listings_03.21<- read.csv("listings-03.21.csv")
listings_04.21<- read.csv("listings-04.21.csv")
listings_05.21<- read.csv("listings-05.21.csv")

#packages
library(dplyr)
library(tidyverse)

#inspecting dataframe
head(listings_12.20)
summary(listings_12.20)#reviews_per_month,last_review,neighbourhood_group contains NA's only

#cleaning & transformation

#dropping columns
#function for all datasets
col_clean_df = function(df){
  cols_to_drop=c('latitude','longitude','neighbourhood_group','minimum_nights','availability_365','host_name','name','calculated_host_listings_count','reviews_per_month')
  col_clean_df  = df[, which(!colnames(df)%in%cols_to_drop)]
}

listings_12.20 = col_clean_df(listings_12.20)
listings_01.21 = col_clean_df(listings_01.21)
listings_02.21 = col_clean_df(listings_02.21)
listings_03.21 = col_clean_df(listings_03.21)
listings_04.21 = col_clean_df(listings_04.21)
listings_05.21 = col_clean_df(listings_05.21)


#renaming column name id
colnames(listings_12.20)[which(colnames(listings_12.20)=='id')]<-'accomondation_id'
colnames(listings_01.21)[which(colnames(listings_01.21)=='id')]<-'accomondation_id'
colnames(listings_02.21)[which(colnames(listings_02.21)=='id')]<-'accomondation_id'
colnames(listings_03.21)[which(colnames(listings_03.21)=='id')]<-'accomondation_id'
colnames(listings_04.21)[which(colnames(listings_04.21)=='id')]<-'accomondation_id'
colnames(listings_05.21)[which(colnames(listings_05.21)=='id')]<-'accomondation_id'

#convert into date
class(listings_12.20$last_review)
listings_12.20$last_review = as.Date(listings_12.20$last_review)
listings_01.21$last_review = as.Date(listings_01.21$last_review)
listings_02.21$last_review = as.Date(listings_02.21$last_review)
listings_03.21$last_review = as.Date(listings_03.21$last_review)
listings_04.21$last_review = as.Date(listings_04.21$last_review)
listings_05.21$last_review = as.Date(listings_05.21$last_review)
#inspect date
min(listings_12.20$last_review,na.rm=TRUE)
max(listings_12.20$last_review,na.rm=TRUE)

#combining data
#quick look at df
glimpse(listings_12.20)
glimpse(listings_01.21)
glimpse(listings_02.21)
glimpse(listings_03.21)
glimpse(listings_04.21)
glimpse(listings_05.21)

#vertically combining

combined_listings = bind_rows(listings_12.20, listings_01.21,listings_02.21, listings_03.21, listings_04.21,listings_05.21)
glimpse(combined_listings)


#selecting subset of data
#inspecting
inspect_data <- function(df){
  cat('Generating some descriptive statistics...\n\n')
  cat('Data: ')
  cat(deparse(substitute(df)))
  cat('\n\n')
  
  cat('Summary statistics\n')
  print(summary(df))
  cat('\n\n')
  
  cat('Number of columns: ')
  cat(ncol(df))
  cat('\n\n')
  
  
  cat('Number of observations: ')
  cat(nrow(df))
  cat('\n\n')
  
  cat('Range of the data:\n')
  summary(df$date)
  cat('\n\n')
  
}

inspect_data(combined_listings)

#transforming variables
#neighbourhouud-> group by district
combined_listings$ accomondation_id = as.numeric(combined_listings$ accomondation_id)
combined_listings$ host_id = as.character(combined_listings$ host_id)
class(combined_listings$host_id)

#change variable names according to districts in amsterdam
combined_listings$neighbourhood[combined_listings$neighbourhood == "Centrum-Oost"] <- "Amsterdam_Center"
combined_listings$neighbourhood[combined_listings$neighbourhood == "Centrum-West"] <- "Amsterdam_Center"
combined_listings$neighbourhood[combined_listings$neighbourhood == "Bos en Lommer"] <- "Amsterdam_West"
combined_listings$neighbourhood[combined_listings$neighbourhood == "De Baarsjes - Oud-West"] <- "Amsterdam_West"
combined_listings$neighbourhood[combined_listings$neighbourhood == "Westerpark"] <- "Amsterdam_West"
combined_listings$neighbourhood[combined_listings$neighbourhood == "IJburg - Zeeburgereiland"] <- "Amsterdam_Oost"
combined_listings$neighbourhood[combined_listings$neighbourhood == "Oostelijk Havengebied - Indische Buurt"] <- "Amsterdam_Oost"
combined_listings$neighbourhood[combined_listings$neighbourhood == "Watergraafsmeer"] <- "Amsterdam_Oost"
combined_listings$neighbourhood[combined_listings$neighbourhood == "Noord-Oost"] <- "Amsterdam_Noord"
combined_listings$neighbourhood[combined_listings$neighbourhood == "Noord-West"] <- "Amsterdam_Noord"
combined_listings$neighbourhood[combined_listings$neighbourhood == "Buitenveldert - Zuidas"] <- "Amsterdam_Zuid"
combined_listings$neighbourhood[combined_listings$neighbourhood == "De Pijp - Rivierenbuurt"] <- "Amsterdam_Zuid"
combined_listings$neighbourhood[combined_listings$neighbourhood == "Zuid"] <- "Amsterdam_Zuid"
combined_listings$neighbourhood[combined_listings$neighbourhood == "De Aker- Nieuw Sloten"] <- "Amsterdam_Nieuw_west"
combined_listings$neighbourhood[combined_listings$neighbourhood == "Geuzenveld - Slotermeer"] <- "Amsterdam_Nieuw_west"
combined_listings$neighbourhood[combined_listings$neighbourhood == "Osdorp"] <- "Amsterdam_Nieuw_west"
combined_listings$neighbourhood[combined_listings$neighbourhood == "Slotervaart"] <- "Amsterdam_Nieuw_west"
combined_listings$neighbourhood[combined_listings$neighbourhood == "Bijlmer-Centrum"] <- "Amsterdam_Zuidoost"
combined_listings$neighbourhood[combined_listings$neighbourhood == "Bijlmer-Oost"] <- "Amsterdam_Zuidoost"
combined_listings$neighbourhood[combined_listings$neighbourhood == "Gaasperdam - Driemond"] <- "Amsterdam_Zuidoost"



#merged datasets
merged_listings<- listings_12.20 %>% 
  inner_join(listings_01.21,listings_02.21,listings_03.21, listings_04.21, listings_05.21, by = c("accomondation_id" = "accomondation_id"))


