setwd("~/BHDS2010/Assignment3/Assignment3")

install.packages("pastecs")

library(pastecs)

Message_data <- read.csv("TextMessages.csv", header=TRUE)

head(Message_data)

Message_data$Group <- as.factor(Message_data$Group)

by(Message_data$Baseline, Message_data$Group, function(X)round(stat.desc(X),2))

by(Message_data$Six_months, Message_data$Group, function(X)round(stat.desc(X),2))
