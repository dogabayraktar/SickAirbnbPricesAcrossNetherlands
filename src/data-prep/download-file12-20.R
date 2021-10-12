######################
### DOWNLOAD DATA ####
######################

# The listing
url_listings12.20 <- "http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2020-12-12/data/listings.csv.gz"

# downloading the file and saving it in the data folder
download.file(url_listings12.20, "../../data/listings-12.20.csv.gz")
