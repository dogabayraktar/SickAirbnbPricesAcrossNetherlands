######################
### DOWNLOAD DATA ####
######################

library(dplyr)
library(reshape2)

download_data <- function(url, filename){
  download.file(url = url, destfile = paste0("../../data/", filename, ".csv"))
}

# all listings
url_listings12.20 <- "http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2020-12-12/data/listings.csv"
url_listings01.21 <- "http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2021-01-09/data/listings.csv"

download_data(url_listings12.20, "listings-12.20")
download_data(url_listings01.21, "listings-01.21")


