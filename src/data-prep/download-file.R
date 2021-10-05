######################
### DOWNLOAD DATA ####
######################

# all listings
url_listings12.20 <- "http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2020-12-12/data/listings.csv.gz"
url_listings01.21 <- "http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2021-01-09/data/listings.csv.gz"
url_listings02.21 <- "http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2021-02-08/data/listings.csv.gz"
url_listings03.21 <- "http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2021-03-04/data/listings.csv.gz"
url_listings04.21 <- "http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2021-04-09/data/listings.csv.gz"
url_listings05.21 <- "http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2021-05-19/data/listings.csv.gz"

# downloading all files and saving them in the data folder
download.file(url_listings12.20, "../../data/listings-12.20.csv.gz")
download.file(url_listings01.21, "../../data/listings-01.21.csv.gz")
download.file(url_listings02.21, "../../data/listings-02.21.csv.gz")
download.file(url_listings03.21, "../../data/listings-03.21.csv.gz")
download.file(url_listings04.21, "../../data/listings-04.21.csv.gz")
download.file(url_listings05.21, "../../data/listings-05.21.csv.gz")