#---Install Packages---#
install.packages(googledrive)
install.packages(readr)

# --- Load Libraries --- #
library(googledrive)
library(readr)

# --- Download data --- #
data_id <- "https://drive.google.com/file/d/1enXSSxXFwCYJyo7o2aLo1w1cQ59HiB9c/view?usp=sharing" 
out_file <- "../data/covid19_cases.csv" 

drive_download(
    as_id(data_id), 
    path = out_file,
    overwrite = TRUE)
