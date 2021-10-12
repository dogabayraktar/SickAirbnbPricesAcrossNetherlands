


# "How Covid-19 infected the Airbnb prices in Amsterdam, The Netherlands"

# A study on how the second lockdown in the Netherlands affected the AirBnb market in Amsterdam


Research question:To what extent is the effect of the second lockdown in the districts of Amsterdam on Airbnb prices?

## Motivation
At the end of 2019, the first infection of the corona virus was detected in China and since then this virus has gripped almost all countries in the world [Chen et al., 2020](https://www.frontiersin.org/articles/10.3389/fcell.2020.00476/full).The Netherlands has also been affected by the corona virus and has had to take various measures to limit the spread of the corona virus. In December 2020, the Netherlands entered the second lockdown till May 2021.During this lockdown, the Netherlands had to deal with far-reaching measures.  Some examples of these gripping measures are:

* Keep 1.5 meters away from people who are not part of your household;
* All non-essential visiting locations were closed;
* Only use public transport if necessary.

The above examples are just a few examples of the measures which were applied during the second lockdown and it is almost inconceivable that these measures have not had an impact on the AirBnb market. Therefore, this study will pay attention to one of concequence of this second lockdown on the Airbnb market, namely price of the Airbnb accomondations.

Ultimately, this study will therefore answer the following questions:
* How did the prices of the Airbnbs in the specific location, Amsterdam change throughout the five months (December 2020, May 2021)within the districts of Amsterdam?
* At which districts was there significant price change and in which way was this price change?


With the information obtained from this study, AirBnb owners can more easily respond to the wishes of customers during the next pandemic or lockdown and thereby limit their economic damage from that pandemic/epidemic. Covid-19 is not the first pandemic/epidemic that the earth has known and research expects that it will not be the last (WHO, 2020). 
This study therefore helps AirBnb owners to prepare for the next pandemic/epidemic.

![image1](https://user-images.githubusercontent.com/89807582/136343144-d28c112a-9c36-4c83-8997-f9d549e1127f.jpg)




## Research method

## Way of deployment


## Data
For this research project Airbnb data will be used, accessed through [Inside Airbnb](http://insideairbnb.com/get-the-data.html).The datasets used in this project are all based in the listings in Amsterdam, The Netherlands and framed through the timeline 12 December 2020 including and to January 2021, February 2021, March 2021, April 2021 and 19 May 2021. These date frames are selected with accordance to the second COVID-19 lock-down dates (14 December 2020 -11 May 2021) in the Netherlands, where measures and restrictions are taken heavily towards COVID-19 where after May 11 the relaxation steps of these measures were taken.

## Method and results

In this chapter we will give a brief overview of the methods that have been applied, followed by the results from the ANOVA test and ends with the conclusion to our research question. 

### Method


First we started out by downloading and cleaning the data. We got the data from Airbnb Inside and chose to focus on the impact of the second lockdown in the Netherlands on the price per night of an Air bnb accommodation in Amsterdam and the influence of the location on this. We choose to pick the months December 2020 till May 2021 so we would have a clear view of the months before the second lockdown (December and January), during the lockdown (February and March) and after the second lockdown (April and May).  

We filtered out the columns that we needed, all related to price and district and categorized them in seven districts: Oost-, Center-, Zuid-, West-, Noord-, Nieuw West- and Zuidoost Amsterdam. The data of all months were merged together. The ANOVA analysis fits our research question best, with the independent variable being categorical (the second lockdown in the Netherlands) and our dependent variable being continuous (price per night). The ANOVA analysis estimates how the price changed due to the second lockdown and what the influence of the district is on this change. ANOVA tests whether there is a difference in means of the groups at each level of the independent variable. 

### Results

To answer the research question, the method that will be applied in this research is one way ANOVA. One-way ANOVA ("analysis of variance") is a method used to compare the means of two or more groups in order to determine whether or not the difference in the means of these groups are statistically different.
The price difference after the second lockdown in Amsterdam, The Netherlands will be calculated manually but the main relation of whether or not this price difference is significantly different across the districts within Amsterdam is tested with one-way ANOVA.

After applying the analysis to our merged data sets over the moths of the second lockdown we have reached the following results:

ANOVA OUTPUT P

The p- value (7.46e-10) is less then the significance level of 0.05. Therefor we can conclude that there is a significance difference between the different districts (variable: neighbourhood_cleansed).

The ANOVA test assumes that, the data is normally distributed and the variance between groups is homogeneous. We can check that with some diagnostic plots. In the plot below, there are no obvious relationships between residuals and adjusted values (the mean of each groups), which is good. So we can assume the homogeneity of variances. In order to come to this conclusion, we decided to filter out the outliers that appeared above the 6000.

GRAPH BLACK DOTS

In addition we also used the Levene’s test to check the homogeneity of the variances. The Pr(<F) output we got is 2.2e-16. From this output we can see that the p-value is not less than the significance level of 0.05. This means that there is no evidence to suggest that the variance across groups is statistically significantly different. Therefore, we can assume the homogeneity of variances in the different treatment groups. Also, as all the points fall approximately along this reference line, we can assume normality.

As the ANOVA test is significant, we can compute Tukey HSD (Tukey Honest Significant Differences, R function: TukeyHSD()) for performing multiple pairwise-comparison between the means of groups. When taking a look at the output of the function we can conclude that the difference between Amsterdam- Center with all the other districts gives a significant p-value below 0.05. For all the other differences between districts, there is no significant difference. 

OUTPUT TUKEY

### Conclusion

After analyzing the data we collected we can conclude that there is a slightly change in price due to the second lockdown, mostly after the lockdown. This is more visible in the center then the districts around Amsterdam. 


## Repository overview

The repository consists of four folders (workflow, data, src, and gen), and three files (.gitignore, README.md, and dprep-sick.Rproj). The aim of the research project, instructions, running details and results are communicated in README.md file where you are currently viewing. The data being using in this project can be found in the data folder but can also be accessed through the src folder,make file where the overflow of running instructions for the analysis is also provided. 

## Running instructions

### Required Software
In order to run the code without problems:
-	Install R and R studio
-	In order to run the code a few additional packages within R are required (these packages are also   mentioned in the code when needed):

- install.packages("googledrive")
- install.packages(“readr”)
- install.packages(“dplyr”)
- install.packages(“tidyverse”)
- install.packages(“stringr”)
- install.packages(“ggpubr”)
- install.packages(“ggplot2”)
- install.packages(“car”)
- install.packages(“effectsize”)
- install.packages(“broom”)
- install.packages(“agricolae”)

- Install Make. For the smooth reproduction of the workflow steps.



Explain to potential users how to run/replicate your workflow. Touch upon, if necessary, the required input data, which (secret) credentials are required (and how to obtain them), which software tools are needed to run the workflow (including links to the installation instructions), and how to run the workflow. Make use of subheaders where appropriate. 

### Running The Workflow
The Make file will run the worflow in the following order below. If interested the steps mentioned below can be run seperately by the makefiles connected in their own folders. (eg:../src/analysis -> make.file).

- download_data.R
- data_cleaning.R
- analysis.R


## More resources

Point interested users to any related literature and/or documentation.

## About

This research is carried out in implementation of the course Data Preparation and Workflow Management. This is a part of the Master program of Marketing Analytics. The following authors contributed to this research:

- [Bram van den Bemt](https://github.com/bramvdbemt) b.c.r.vdnbemt@tilburguniversity.edu
- [Doğa Bayraktar](https://github.com/dogabayraktar) d.b.bayraktar@tilburguniversity.edu
- [Demi de Groot](https://github.com/Demidegroot) d.degroot@tilburguniversity.edu
- [Ellen van Berlo](https://github.com/EllenB1) e.d.vanberlo@tilburguniversity.edu
- [Sam Messaoudi](https://github.com/SamMes98) s.t.l.messaoudi@tilburguniversity.edu
