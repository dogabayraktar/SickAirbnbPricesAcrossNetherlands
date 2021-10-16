######################
######################
### ANOVA ANALYSIS ###
######################
######################

dir.create('../../gen/output')

# --- Library's --- #
library(readr)
library(dplyr)
library(ggpubr)
library(ggplot2)
library(car)
library(effectsize)
library(broom)
library(agricolae)
library(tidyverse)

#--- Loading the cleaned data sets---#


# load in the complete price comparison between all six data set
price_comparison <- read.csv('../../gen/temp/complete_price_comparison.csv')

# removing all columns unrelated to the price and district
only_price_district <- price_comparison%>%
  select(neighbourhood_cleansed,price_12.20,price_01.21,price_02.21,price_03.21,price_04.21,price_05.21)

#creating a new column with the price difference
only_price_district$price_difference<-((only_price_district$price_05.21)-(only_price_district$price_12.20))

#writing the CSV file
write.csv(only_price_district, "../../gen/temp/only_price_district.csv")

#---ANOVA Analysis---#


#computing summary stats
summary_stats<- group_by(only_price_district,neighbourhood_cleansed)%>%
  summarise(
    count = n(),
    mean = mean(price_difference, na.rm = TRUE),
    sd = sd(price_difference, na.rm = TRUE)
  )
write.csv(summary_stats, "../../gen/output/summary_stats.csv")


#---Visualizing data---#


# Mean plots- Plot district by price difference,add error bars
meanplot_pricedif_district <- ggline(only_price_district, x = "neighbourhood_cleansed", y = "price_difference",
       add = c("mean_se", "jitter"), 
       ylab = "District", xlab = "Price difference")

ggsave(plot = meanplot_pricedif_district, filename = "../../gen/output/meanplot_pricedif_district.pdf")


#---Cleaning data---#
# Filtering out the outliers
only_price_district<- filter(only_price_district,only_price_district$price_difference<6000)

# Box plots. Plot district by price difference and color by district after filtering out outliers.

boxplot_pricedif_district_filtered<-ggboxplot(only_price_district, x = "neighbourhood_cleansed", y = "price_difference", 
                                     color = "neighbourhood_cleansed",
                                     ylab = "District", xlab = "Price difference")

ggsave(plot= boxplot_pricedif_district_filtered, filename = "../../gen/output/boxplot_pricedif_district_filtered.pdf")

#--Testing assumptions for ANOVA---#

#Levene's test of homogenity 
leveneTest<- leveneTest(price_difference~neighbourhood_cleansed,only_price_district, center=mean)
only_price_district %>% count(neighbourhood_cleansed)
write.csv(leveneTest, "../../gen/output/leveneTest.csv")

#Normality test
ks.test(only_price_district$price_difference, "pnorm", mean=mean(only_price_district$price_difference), sd=sd(only_price_district$price_difference))


#Computing ANOVA
only_price_district.aov<-aov(price_difference~neighbourhood_cleansed, data = only_price_district)
summary(only_price_district.aov)
write.csv(only_price_district.aov, "../../gen/output/only_price_district.aov.csv")

#Plot homogenity of variance
plot(only_price_district.aov, 1)

#Pairwise comparison for differences among districts
TukeyHSD(only_price_district.aov) #diff: difference between means of the two groups

#Partial eta-squared 
eta_squared<- eta_squared(only_price_district.aov, ci=0.95, partial=TRUE)
write.csv(eta_squared,"../../gen/output/eta_squared.csv" )

#---Plotting the results---#

#Plotting results in a table
tukey.plot.aov<-aov(price_difference~neighbourhood_cleansed, data = only_price_district)
write.csv(tukey.plot.aov, "../../gen/output/tukey.plot.aov.csv")

#Plotting results in a graph

pdf("../../gen/output/tukey.plot.test.pdf")

tukey.plot.test<-TukeyHSD(tukey.plot.aov)
plot(tukey.plot.test, las = 1)
tukey.plot.test

dev.off()


















