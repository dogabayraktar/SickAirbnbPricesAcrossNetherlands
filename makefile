all: analysis data-preparation

data-preparation:
	make -C src/data-prep

analysis: data-preparation
	make -C src/analysis

clean:
	-rm -r data
	-rm -r gen

