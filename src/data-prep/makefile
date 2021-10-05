TEMP = ../../gen/temp
DATA = ../../data

all: $(DATA)/listings-12.20.csv.gz $(DATA)listings-01.21.csv.gz $(DATA)listings-02.21.csv.gz $(DATA)listings-03.21.csv.gz $(DATA)listings-04.21.csv.gz $(DATA)listings-05.21.csv.gz 

$(DATA)/listings-12.20.csv.gz: download-file.R
	mkdir -p ../../data	
	R --vanilla < download-file.R 

$(DATA)listings-01.21.csv.gz: download-file.R 
	R --vanilla < download-file.R 

$(DATA)listings-02.21.csv.gz: download-file.R 
	R --vanilla < download-file.R 

$(DATA)listings-03.21.csv.gz: download-file.R 
	R --vanilla < download-file.R 

$(DATA)listings-04.21.csv.gz: download-file.R 
	R --vanilla < download-file.R 

$(DATA)listings-05.21.csv.gz: download-file.R
	R --vanilla < download-file.R 

	
