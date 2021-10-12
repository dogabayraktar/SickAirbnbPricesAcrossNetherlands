TEMP = ../../gen/temp
DATA = ../../Data

all: $(DATA)/listings-12.20.csv.gz $(DATA)listings-01.21.csv.gz $(DATA)listings-02.21.csv.gz $(DATA)listings-03.21.csv.gz $(DATA)listings-04.21.csv.gz $(DATA)listings-05.21.csv.gz 

$(DATA)/listings-12.20.csv.gz: download-file12-20.R
	mkdir -p ../../data	
	R --vanilla < download-file12-20.R 

$(DATA)listings-01.21.csv.gz: download-file01-21.R	
	R --vanilla < download-file01-21.R  


$(DATA)listings-02.21.csv.gz: download-file02-21.R	
	R --vanilla < download-file02-21.R  


$(DATA)listings-03.21.csv.gz: download-file03-21.R	
	R --vanilla < download-file03-21.R  


$(DATA)listings-04.21.csv.gz: download-file04-21.R	
	R --vanilla < download-file04-21.R  


$(DATA)listings-05.21.csv.gz: download-file05-21.R	
	R --vanilla < download-file05-21.R 


	
