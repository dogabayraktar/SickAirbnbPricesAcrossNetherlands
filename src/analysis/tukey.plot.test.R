#--Plotting AOV results in  a graph---#

#computing ANOVA
only_price_district.aov<-aov(price_difference~neighbourhood_cleansed, data = only_price_district)
summary(only_price_district.aov)

#plot homogenity of variance
plot(only_price_district.aov, 1)
#pairwise comparison for differences among districts
TukeyHSD(only_price_district.aov) #diff: difference between means of the two groups

#Plotting results in a graph
tukey.plot.test<-TukeyHSD(tukey.plot.aov)
plot(tukey.plot.test, las = 1)