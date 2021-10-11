DATA = ../../Data
TEMP = ../../gen/temp
OUTPUT = = ../../gen/output

all: $(TEMP)/only_price_district.csv $(OUTPUT)/boxplot_pricedif_district.pdf $(OUTPUT)/meanplot_pricedif_district.pdf $(OUTPUT)/tukey.plot.aov.csv $(OUTPUT)/tukey.plot.test.pdf

$(TEMP)/only_price_district.csv: $(TEMP)/complete_price_comparison.csv only_price_district.R
		mkdir -p ../../gen/output
    R --vanilla < only_price_district.R

$(OUTPUT)/boxplot_pricedif_district.pdf:$(TEMP)/only_price_district.csv boxplot_pricedif_district.R
		R --vanilla < boxplot_pricedif_district.R
		
$(OUTPUT)/meanplot_pricedif_district.pdf: $(TEMP)/only_price_district.csv meanplot_pricedif_district.R
		R --vanilla < meanplot_pricedif_district.R

$(OUTPUT)/tukey.plot.aov.csv:$(TEMP)/only_price_district.csv tukey.plot.aov.R
		R --vanilla < tukey.plot.aov.R
		
$(OUTPUT)/tukey.plot.test.pdf:$(TEMP)/only_price_district.csv tukey.plot.test.R
		R --vanilla < tukey.plot.test.R