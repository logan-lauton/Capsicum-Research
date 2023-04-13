##Logan Lauton
##Logan.Lauton@marquette.edu
##Capsicum Research Data Cleaning

##clear your working directory
rm(list=ls())
##install packages
##this only needs to be done once

##load libraries
##this needs to be done at the beginning of each new session


##loading in required data
cap_data <- read.csv("~\\Sogolytics_Capsicum Genus Research Projec_2.csv")

##cleaning table
head(cap_data)
colnames(cap_data)[1] <- 'ID' 
colnames(cap_data)[3] <- 'Gender' 
colnames(cap_data)[4] <- 'Birthday' 
colnames(cap_data)[5] <- 'Location'
new_data <- cap_data[-c(1), ]

##data cleansing
new_data$X1.c...Basic.Demographics....State <- paste(new_data$X1.c...Basic.Demographics....State, new_data$X2.What.is.your.race.,new_data$X, new_data$X.1, new_data$X.2, new_data$X.3)
new_data$X2.What.is.your.race. <- paste(new_data$X.4, new_data$X3.What.is.your.ethnicity. ,new_data$X.5)
new_data <- new_data[,-c(8:14)]

##cleaning new table
colnames(new_data)[6] <- 'Race'
colnames(new_data)[7] <- 'Ethnicity'
colnames(new_data)[8] <- 'Satisfaction_growing_plants'
colnames(new_data)[9] <- 'Satisfaction_growing_veggies'
colnames(new_data)[10] <- 'Familiar_with_capsicum'
colnames(new_data)[11] <- 'Grow_capsicum'

##data cleansing pt 2
new_data$X7.I.regularly.grow.Capsicum.Species.in.my.garden. <- paste(new_data$X7.I.regularly.grow.Capsicum.Species.in.my.garden. , new_data$X8.I.am.familiar.with.a.wholesale.greenhouse.growing.company..e.g..Bonnie.Plants)
new_data <- new_data[,-c(13)]

##cleaning new table again
colnames(new_data)[12] <- 'Familiar_with_wholesale'
colnames(new_data)[13] <- 'Purchase_from_wholesale'
colnames(new_data)[14] <- 'Satisfies_with_wholesale'
colnames(new_data)[15] <- 'Yield_from_wholesale'
colnames(new_data)[16] <- 'Save_seeds'
colnames(new_data)[17] <- 'Share_seeds'

## final data cleaning
new_data$X13.I.often.share.seeds..from.vegetables.that.I.grew..with.friends.and.family.in.hopes.they.will.grow.them. <- paste(new_data$X13.I.often.share.seeds..from.vegetables.that.I.grew..with.friends.and.family.in.hopes.they.will.grow.them. , new_data$X14.I.would.be.willing.to.grow.a.wild.Capsicum.species.to.try.to.help.protect.the.species.)
new_data <- new_data[,-c(19,21)]

## final cleaning of table
colnames(new_data)[18] <- 'Willing_to_grow_endangered'
colnames(new_data)[19] <- 'Comments'

##replacing cap_data with the new_data table
cap_data <- new_data

##removing new_data to reduce space in global environment
rm(new_data)

##writing new csv of the cap_data
write.csv(cap_data, "cap_data.csv", row.names=FALSE)

##removing comments as some people put identifiable information in there
##this dataframe will be avaliable on the github 
cap_data <- cap_data[,-c(19)]

##export csv for github
write.csv(cap_data, "cap_data_github.csv", row.names = FALSE)
