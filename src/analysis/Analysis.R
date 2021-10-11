
#####################
#####################
### TEXT ANALYSIS ###
#####################
#####################

# --- Library's --- #
library(readr)
library(dplyr)
library(ggpubr)
library(car)
library(effectsize)

#--- Loading the cleaned data sets---#


# load in the complete price comparison between all six data set
price_comparison <- read.csv('../../gen/temp/complete_price_comparison.csv')

# removing all columns unrelated to the price and district
only_price_district <- price_comparison%>%
  select(neighbourhood_cleansed,price_12.20,price_01.21,price_02.21,price_03.21,price_04.21,price_05.21)

# filtering each row that has no price changes and counting them
filter(only_price_district ,duplicated(only_price_district))
nrow(filter(only_price_district ,duplicated(only_price_district)))

# percentage of listings with no price change
percentage_no_price_change <- nrow(filter(only_price_district ,duplicated(only_price_district)))/nrow(price_comparison)

# sub-setting the price comparison to listings with prices that have a change
price_comparison_changed_prices  <- filter(price_comparison, !duplicated(only_price_district))
View(price_comparison_changed_prices)

#creating a new column with the price difference
only_price_district$price_difference<-((only_price_district$price_05.21)-(only_price_district$price_12.20))



#---ANOVA Analysis---#



#computing summary stats
group_by(only_price_district,neighbourhood_cleansed)%>%
  summarise(
    count = n(),
    mean = mean(price_difference, na.rm = TRUE),
    sd = sd(price_difference, na.rm = TRUE)
  )

#---Visualizing data---#

# Box plots. Plot district by price difference and color by district

ggboxplot(only_price_district, x = "neighbourhood_cleansed", y = "price_difference", 
          color = "neighbourhood_cleansed",
          ylab = "District", xlab = "Price difference")

ggsave("gen/boxplot_pricedif_district.pdf")

# Mean plots- Plot district by price difference,add error bars: mean_se, (other values include: mean_sd, mean_ci, median_iqr, ....)
ggline(only_price_district, x = "neighbourhood_cleansed", y = "price_difference",
       add = c("mean_se", "jitter"), 
       ylab = "District", xlab = "Price difference")

ggsave("gen/meanplot_pricedif_district.pdf")


#---Cleaning data---#
# filtering out the outliers
only_price_district<- filter(only_price_district,only_price_district$price_difference<6000)

#--Testing assumptions for ANOVA---#
#Levene's test of homogenity 
leveneTest(price_difference~neighbourhood_cleansed,only_price_district, center=mean)
only_price_district %>% count(neighbourhood_cleansed)
#for normality
ks.test(only_price_district$price_difference, "pnorm", mean=mean(only_price_district$price_difference), sd=sd(only_price_district$price_difference))

#computing ANOVA
only_price_district.aov<-aov(price_difference~neighbourhood_cleansed, data = only_price_district)
summary(only_price_district.aov)

#plot homogenity of variance
plot(only_price_district.aov, 1)
#pairwise comparison for differences among districts
TukeyHSD(only_price_district.aov) #diff: difference between means of the two groups

#Partial eta-squared 
eta_squared(only_price_district.aov, ci=0.95, partial=TRUE)
















