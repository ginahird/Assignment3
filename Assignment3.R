################################################################################
## Setup
################################################################################
#install.packages("ggplot2")
#install.packages("tidyr")
#install.packages("pastecs")
#install.packages("reshape2")
library(ggplot2)
library(tidyr)
library(pastecs)
library(reshape2)

#setting data set
text_data <- read.csv("TextMessages.csv", header = TRUE)

################################################################################
## Visualization 1
################################################################################

#factoring Group column so that is has appropriate levels for faceting
text_data$Group <- factor(text_data$Group, levels=c(1,2),
                          labels=c("Group 1", "Group 2"))

#converting to long form data, preferable for a boxplot
text_long <- pivot_longer(text_data, cols=c(Baseline, Six_months),
                          names_to="Time", values_to="Messages")

#factoring time since this we also be needed in the boxplot
text_long$Time <- factor(text_long$Time, levels=c("Baseline", "Six_months"),
                         labels=c("Baseline", "Six Months"))

#box plot output
ggplot(text_long, aes(x=Time, y=Messages, fill=Time)) +
  geom_boxplot() +
  facet_wrap(~ Group) +
  labs(title = "Number of Text Messages by Group and Time",
       x="Time", y="Number of Text Messages") +
  theme(legend.position = "none")

################################################################################
## Visualization 2
################################################################################

head(text_data)

text_long_melt <- melt(text_data, id.vars = c("Group","Participant"),
                       variable.name ="Time",
                       value.name = "Messages")

range(text_long_melt$Messages)

text_long_melt$Group <- factor(text_data$Group, levels=c(1,2),
                               labels=c("Group 1", "Group 2"))

is.factor(text_long_melt$Time)

BarWithErrors_MessageTimeByGroup <- ggplot(text_long_melt, 
                                           aes(Group,
                                               Messages))

BarWithErrors_MessageTimeByGroup +
  stat_summary(fun = mean, geom="bar",fill="White", colour="black") +
  stat_summary(fun.data=mean_cl_normal, geom="pointrange", colour= "Red") +
  labs(x="Group", y="Number of Text Messages", 
       title= "Mean Messages Per Group at Baseline and After Six Months") + 
  facet_wrap(.~Time) +
  scale_y_continuous(limits= c(0,90), breaks=seq(from=0, to=90, by=5))


################################################################################
## Summary Statistics
################################################################################


head(text_data)

by(text_data$Baseline, text_data$Group, 
   function(X)round(stat.desc(X),2))

by(text_data$Six_months, text_data$Group, 
   function(X)round(stat.desc(X),2))


################################################################################
## Documentation
################################################################################


