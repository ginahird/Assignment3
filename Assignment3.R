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
                          labels=paste0(c("Group 1", "Group 2"), " (n = ", 
                                        table(text_data$Group),")"))

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
  labs(title = paste0("Number of Text Messages by Group and Time, N = ", 
                      nrow(text_data)),
       x="Time", y="Number of Text Messages",
       caption = paste0("Footnotes: \nN = total number of participants across ",
       "all groups. \nn = number of participants within a group.")) +
  theme(plot.caption = element_text(hjust=0),legend.position = "none")

##Comments
##Both groups had a similar distribution at baseline, both with medians of 
##around 65 text messages. At six months, both saw a decrease, though it was 
##more substantial in Group 1. Group 1 also has a greater spread of scores at 
##six months, while Group 2's became more condensed. Group 1 also has the 
##addition of several low outliers at six months. The plot shows 4 of these low
##outliers for Group 1 six months, which is of note since that sample size is 
##only 25 participants. Group 2's six month box plot does show a decline overall
##and the narrowing of the box shows that participants are scoring more closely 
##to one another. More testing would be needed in both cases to determine if the
##decrease was statistically significant; a paired t-test would make sense for 
##this data.

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


