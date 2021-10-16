TEMP = ../../gen/temp
DATA = ../../data

all: install_packages $(DATA)/listings-12.20.csv.gz $(DATA)/listings-01.21.csv.gz $(DATA)/listings-02.21.csv.gz $(DATA)/listings-03.21.csv.gz $(DATA)/listings-04.21.csv.gz $(DATA)/listings-05.21.csv.gz $(TEMP)/complete_price_comparison.csv 

install_packages: install_packages.R
	R --vanilla < install_packages.R

$(DATA)/listings-12.20.csv.gz: download-file.R	
	R --vanilla < download-file.R 

$(DATA)/listings-01.21.csv.gz: 

$(DATA)/listings-02.21.csv.gz: 

$(DATA)/listings-03.21.csv.gz: 

$(DATA)/listings-04.21.csv.gz: 

$(DATA)/listings-05.21.csv.gz:

$(TEMP)/complete_price_comparison.csv: data_cleaning.R
	R --vanilla < data_cleaning.R 



	
