library(googledrive)
library(readr)

# --- Download data --- #
data_id <- "https://drive.google.com/file/d/1MtaPsHG7R0miViKmWG9AwylDyB1_nD9n/view?usp=sharing"
out_file <- "../data/listings_Feb21.csv" 

drive_download(
  as_id(data_id), 
  path = out_file,
  overwrite = TRUE)
