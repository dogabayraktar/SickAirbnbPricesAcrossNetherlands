# correction to remove unwanted Rplots.pdf that is created by the makefile when executed with the command line.
# This is a common problem but it is a bit complicated to solve: https://stackoverflow.com/questions/17348359/how-to-stop-r-from-creating-empty-rplots-pdf-file-when-using-ggsave-and-rscript
unlink("Rplots.pdf", force = TRUE)