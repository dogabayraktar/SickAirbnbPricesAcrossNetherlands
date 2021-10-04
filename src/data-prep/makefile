TEMP = ../../gen/temp
DATA = ../../data

all: $(DATA)/listings-12.20.csv $(DATA)listings-01.21.csv $(TEMP)/comp12.20-01.21.csv 

$(DATA)/listings-12.20.csv $(DATA)listings-01.21.csv: download-file.R
	mkdir -p ../../data	
	R --vanilla < download-file.R 

$(TEMP)/comp12.20-01.21.csv: data_cleaning.R 
	mkdir -p ../../gen/temp
	R --vanilla < data_cleaning.R

	
