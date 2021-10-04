library(googledrive)
library(readr)

# --- Download data --- #
data_id <- "https://drive.google.com/file/d/1lVs0Xtw1RV1iyRZwDs-ISbq09GXGoTpS/view?usp=sharing"
out_file <- "../data/listings_Dec20.csv" 

drive_download(
  as_id(data_id), 
  path = out_file,
  overwrite = TRUE)

 # Alternative wat to download data and save it 
######################
### DOWNLOAD DATA ####
######################

library(dplyr)
library(reshape2)

download_data <- function(url, filename){
  download.file(url = url, destfile = paste0("../../data/", filename, ".csv"))
}

url_listings12.20 <- "http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2020-12-12/data/listings.csv"

download_data(url_listings12.20, "listings-12.20")
