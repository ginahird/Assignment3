setwd("~/BHDS2010/Assignment3/Assignment3")

install.packages("pastecs")
install.packages("Hmisc")
install.packages("ggplot2")
install.packages("reshape2")

library(Hmisc)
library(pastecs)
library(ggplot2)
library(reshape2)

Message_data <- read.csv("TextMessages.csv", header=TRUE)

head(Message_data)

long_Message_data <- melt(Message_data, id.vars = c("Group","Participant"),
                                                    variable.name ="Time",
                                                    value.name = "Value")
range(long_Message_data$Value)

is.factor(long_Message_data$Group)

long_Message_data$Group <- as.factor(long_Message_data$Group)

is.factor(long_Message_data$Group)

is.factor(long_Message_data$Time)

BarWithErrors_MessageTimeByGroup <- ggplot(long_Message_data, 
                                            aes(Group,
                                                Value))

BarWithErrors_MessageTimeByGroup +
  stat_summary(fun = mean, geom="bar",fill="White", colour="black") +
  stat_summary(fun.data=mean_cl_normal, geom="pointrange", colour= "Red") +
  labs(x="Group", y="Time", 
       title= "Mean Message Time Per Group at Baseline and After Six Months") + 
  facet_wrap(.~Time) +
  scale_y_continuous(limits= c(0,90), breaks=seq(from=0, to=90, by=5))




