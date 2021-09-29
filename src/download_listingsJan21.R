#---install packages---#
#install.packages('googledrive')
#install.packages('readr')

library(googledrive)
library(readr)

# --- Download data --- #
data_id <- "https://drive.google.com/file/d/1VzArxoLr6w1RYtd3HLEXD922gTSTndt-/view?usp=sharing"
out_file <- "../data/listings_Jan21.csv" 

drive_download(
  as_id(data_id), 
  path = out_file,
  overwrite = TRUE)
