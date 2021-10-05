library(googledrive)
library(readr)

# --- Download data --- #
data_id <- "https://drive.google.com/file/d/1IzgWm5W2ivWE2Ut7WHAjnEZkNB0J1neH/view?usp=sharing"
out_file <- "../data/listings_Mar21.csv" 

drive_download(
  as_id(data_id), 
  path = out_file,
  overwrite = TRUE)

