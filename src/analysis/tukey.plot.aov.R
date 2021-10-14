#--- AOV Turkey HSD table of results for pairwise comparisons ---#
library(car)
library(effectsize)
library(broom)
library(agricolae)

# loading data set
only_price_district <- read.csv('../../gen/temp/only_price_district.csv')

#computing ANOVA
only_price_district.aov<-aov(price_difference~neighbourhood_cleansed, data = only_price_district)
summary(only_price_district.aov)
#plot homogenity of variance
plot(only_price_district.aov, 1)
#pairwise comparison for differences among districts
TukeyHSD(only_price_district.aov) #diff: difference between means of the two groups
#Plotting results in a table
tukey.plot.aov<-aov(price_difference~neighbourhood_cleansed, data = only_price_district)