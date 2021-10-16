######################
### DOWNLOAD DATA ####
######################

# Creating the data folder
dir.create('../../data')

# creating a list with the download link and file names of the raw data 
files = list(c(url='http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2020-12-12/data/listings.csv.gz',
               fn='listings-12.20.csv.gz'),
             c(url='http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2021-01-09/data/listings.csv.gz',
               fn='listings-01.21.csv.gz'),
             c(url='http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2021-02-08/data/listings.csv.gz',
               fn='listings-02.21.csv.gz'),
             c(url='http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2021-03-04/data/listings.csv.gz',
               fn='listings-03.21.csv.gz'),
             c(url='http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2021-04-09/data/listings.csv.gz',
               fn='listings-04.21.csv.gz'),
             c(url='http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2021-05-19/data/listings.csv.gz',
               fn='listings-05.21.csv.gz'))

# looping over the list to download and save the file in the data folder
for (item in files) {

  download.file(item['url'], paste0('../../data/', item['fn']))
}