library(tidyverse)
library(skimr)
library(janitor)
SSdata <- read.csv("Results1.csv")
# view(SSdata)
trimws(SSdata$Reason_for_Stop)
trimws(SSdata$Outcome)
trimws(SSdata$Outcome_Reason)
trimws(SSdata$Appearance_Group)
trimws(SSdata$Self_Defined_Group)
trimws(SSdata$Gender)
SSdata$Outcome_Reason <- str_replace(SSdata$Outcome_Reason, "Not Applicable", "N Not Applicable")
t1 <-c("code","Reason_for_Outcome")
SSdata <- separate(SSdata, Outcome_Reason, t1,2 )
names(SSdata)[1] <- "Date"
SSdata$Age_Group[SSdata$Apparent_Age < 17] <- "Minor"
SSdata$Age_Group[SSdata$Apparent_Age >= 17 & SSdata$Apparent_Age <= 25] <- "17-25"
SSdata$Age_Group[SSdata$Apparent_Age >= 26 & SSdata$Apparent_Age <= 35] <- "26-35"
SSdata$Age_Group[SSdata$Apparent_Age >= 36 & SSdata$Apparent_Age <= 45] <- "36-45"
SSdata$Age_Group[SSdata$Apparent_Age >= 46 & SSdata$Apparent_Age <= 55] <- "46-55"
SSdata$Age_Group[SSdata$Apparent_Age >= 56 & SSdata$Apparent_Age <= 65] <- "56-65"
SSdata$Age_Group[SSdata$Apparent_Age >= 65] <- "Above 65"
SSdata$Age_Group[SSdata$Apparent_Age == "NULL"] <- "NA"
SSdata%>%
  count(Outcome,Appearance_Group)%>%
  mutate(percent = n*100/sum(n)) %>%
  select(-n)%>%
  spread(Appearance_Group,percent)
SSdata%>%
  count(Reason_for_Outcome,Reason_for_Stop)%>%
  spread(Reason_for_Stop,n)
ggplot(data =SSdata)+
  geom_bar(mapping = aes(x=Appearance_Group, fill=Appearance_Group))
ggplot(data = SSdata)+
  geom_bar(mapping = aes(x=Age_Group, fill=Age_Group))
write.csv(SSdata, "Results.csv")
