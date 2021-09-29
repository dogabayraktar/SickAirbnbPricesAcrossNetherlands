library(googledrive)
library(readr)

# --- Download data --- #
data_id <- "https://drive.google.com/file/d/1lVs0Xtw1RV1iyRZwDs-ISbq09GXGoTpS/view?usp=sharing"
out_file <- "../data/listings_Dec20.csv" 

drive_download(
  as_id(data_id), 
  path = out_file,
  overwrite = TRUE)

  