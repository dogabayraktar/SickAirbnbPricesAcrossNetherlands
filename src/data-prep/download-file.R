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
url_listings02.21 <- "http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2021-02-08/data/listings.csv"
url_listings03.21 <- "http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2021-03-04/data/listings.csv"
url_listings04.21 <- "http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2021-04-09/data/listings.csv"
url_listings05.21 <- "http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2021-05-19/data/listings.csv"

# downloading all files and saving them in the data folder
download_data(url_listings12.20, "listings-12.20")
download_data(url_listings01.21, "listings-01.21")
download_data(url_listings02.21, "listings-02.21")
download_data(url_listings03.21, "listings-03.21")
download_data(url_listings04.21, "listings-04.21")
download_data(url_listings05.21, "listings-05.21")

