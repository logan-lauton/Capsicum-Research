##Logan Lauton
##Logan.Lauton@marquette.edu
##Capsicum Data Research

##clear your working directory
rm(list=ls())
##install packages
##this only needs to be done once
install.packages("ggplot2")
##load libraries
##this needs to be done at the beginning of each new session
library("ggplot2")

##loading in required data
cap_data <- read.csv("~\\cap_data.csv")

##basic intro data exploration
table(cap_data$Location)

xaxis <- c("Completely Dissatisfied", "Dissatisfied", "Neutral", "Satisfied", "Completely Satisfied")

ggplot(cap_data , aes(x = Satisfaction_growing_plants)) + 
  geom_histogram(binwidth = 1, fill = 'lightgrey', col = 'black')+
  theme_minimal()+
  ggtitle('Satisfaction of Growers')+
  theme(plot.title = element_text(hjust = 0.4))+
  ylab('# of Responses')+
  xlab('Level of Satisfaction')+
  scale_x_continuous(breaks = c(2, 3, 4, 5),
                     labels = c("Dissatisfied","Neutral", "Satisfied", "Completely Satisfied"))

ggplot(cap_data , aes(x = Familiar_with_capsicum)) +
  geom_histogram(binwidth = 1, fill='lightgrey', col = 'black')+
  theme_minimal()+
  ggtitle('Capsicum Knowledge of Growers')+
  theme(plot.title = element_text(hjust = 0.4))+
  ylab('# of Responses')+
  xlab('Level of Familiarity')+
  scale_x_continuous(breaks = c(3, 4, 5),
                   labels = c("Heard of", "Familiar", "Knowledgable"))

p_save <- ggplot(cap_data , aes(x = Save_seeds)) 

p_save + geom_histogram(binwidth = 1, fill='lightgrey', col = 'black')+
  theme_minimal()+
  ggtitle('Do Growers Save Seeds?')+
  theme(plot.title = element_text(hjust = 0.4))+
  ylab('# of Responses')+
  xlab('Are Seeds Saved?')+
  scale_x_continuous(breaks = c(1,2,3, 4, 5),
                     labels = c("Completely Disagree","Disagree","Neutral", "Agree", "Completely Agree"))

p_save + geom_histogram(aes(fill = Gender), binwidth = 1, fill='lightgrey', col = 'black')+
  stat_bin(binwidth=1, geom='text', color='black', size=3,
           aes(label=..count.., group=Gender), position=position_stack(vjust=0.4))+
  theme_minimal()+
  ggtitle('Do Growers Save Seeds?')+
  theme(plot.title = element_text(hjust = 0.4))+
  ylab('# of Responses')+
  xlab('Are Seeds Saved?')+
  scale_x_continuous(breaks = c(1,2,3, 4, 5),
                     labels = c("Completely Disagree","Disagree","Neutral", "Agree", "Completely Agree"))


ggplot(cap_data , aes(x = Save_seeds, fill = Gender))+
  geom_histogram(aes(fill = Gender), binwidth = 1, fill='lightgrey', col = 'black')+
  geom_text(size = 3, position = position_stack(vjust = 0.5))
