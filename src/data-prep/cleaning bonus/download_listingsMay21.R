library(googledrive)
library(readr)

# --- Download data --- #
data_id <- "https://drive.google.com/file/d/125XhMOAUcqWs2OokTLAXcbwrwE4TE3g0/view?usp=sharing"
out_file <- "../data/listings_May21.csv" 

drive_download(
  as_id(data_id), 
  path = out_file,
  overwrite = TRUE)
