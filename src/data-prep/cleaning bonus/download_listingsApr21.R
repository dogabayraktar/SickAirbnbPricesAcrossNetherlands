library(googledrive)
library(readr)

# --- Download data --- #
data_id <- "https://drive.google.com/file/d/1pd0DQgsWEFi_fypE27VB8FC3JW2Hg1ye/view?usp=sharing"
out_file <- "../data/listings_Apr21.csv" 

drive_download(
  as_id(data_id), 
  path = out_file,
  overwrite = TRUE)
