#This code generates a barplot using R for 2016 GDP for selected countries.

#created on 8/28/2018

#author: Benjamin Tayo

library(tidyverse)
library(scales)
data<-read.csv("gdp.csv")
head(data)
names(data)[1]="location"
ind<-order(data$Value)
data<-data%>%mutate(location=location[ind],Value=Value[ind])
data%>%ggplot(aes(reorder(location,Value),Value))+geom_col(fill="blue")+
  scale_y_continuous(breaks=seq(0,100000,10000),
                     labels=c("0","10k","20k","30k","40k","50k","60k","70k","80k","90k","100k"))+
  theme(axis.text.x = element_text(angle = 45, hjust = 1,size=6))+theme(axis.title.x=element_blank())+
  theme(axis.title.y=element_blank())+ggtitle("Gross Domestic Product (GDP), Total, US dollars/Capita, 2016 ")

