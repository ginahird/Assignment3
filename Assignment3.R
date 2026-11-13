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

#checking the range of Messages to set the y-axis limits
range(text_long$Messages)

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
  theme(plot.caption = element_text(hjust=0),legend.position = "none") +
  scale_y_continuous(limits = c(0,90), breaks = seq(from = 0, to = 90, by = 10))

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

#converting text data into the long format using melt.
text_long_melt <- melt(text_data, id.vars = c("Group","Participant"),
                       variable.name ="Time",
                       value.name = "Messages")

##Transforming text_data to long a second time here is a little bit redundant, 
##but we elected to keep this code because each partner approached the 
##transformation differently. We wanted to leave both methods in the final output
##to show how people can approach certain problems differently.

#assessing the range of the Messages variable for use in visualization.
range(text_long_melt$Messages)

#checking whether the Group categorical variable is a factor.
is.factor(text_long_melt$Group)

#checking whether the Time categorical variable is a factor.
is.factor(text_long_melt$Time)

#factoring Time again to match the text_long data labels from above
text_long_melt$Time <- factor(text_long_melt$Time, levels=c("Baseline", "Six_months"),
                         labels=c("Baseline", "Six Months"))

#Creating the base plot for the bar graph of Time and Number of Messages.
BarWithErrors_MessageTimeByGroup <- ggplot(text_long_melt, 
                                           aes(Time,
                                               Messages))

#Creating the bar graph of Time and Number of Messages.
BarWithErrors_MessageTimeByGroup +
  stat_summary(aes(fill=Time),fun = mean, geom="bar", colour="black") +
  stat_summary(fun.data=mean_cl_normal, geom="pointrange", colour= "Red") +
  labs(x="Time", y="Number of Text Messages", 
       title= paste0("Number of Text Messages by Group and Time, N = ", 
                     nrow(text_data)), 
       caption = paste0("Footnotes: \nN = total number of participants across ",
                  "all groups. \nn = number of participants within a group."))+ 
  facet_wrap(.~Group) +
  scale_y_continuous(limits= c(0,90), breaks=seq(from=0, to=90, by=10)) +
  theme(plot.caption = element_text(hjust=0),legend.position = "none")

#The bar chart shows that the mean number of text messages was similar at 
#baseline for Group 1 and Group 2, with a mean value of 65. Both groups 
#exhibited a decrease in the mean number of text messages after six months, 
#where Group 1 shows a significant decrease to a mean of 53 and Group 2 
#slightly decreases to a mean of 62. The error bars do not overlap for Group 1,
#suggesting that the decrease in the mean number of texts is significant, 
#whereas the error bars in Group 2 do overlap, hinting that this decrease in 
#value is not significant. Furthermore, a comparison between the six month mean
#number of text messages shows that Group 1 had a significantly lower mean 
#value than Group 2. Similar to visualization 1, a paired t-test would help 
#assess whether the observed differences are statistically significant.

################################################################################
## Summary Statistics
################################################################################

#assessing the organization of variables in the text data.
head(text_data)

#Performing descriptive statistics on the baseline number of text messages 
#stratified by group.
by(text_data$Baseline, text_data$Group, 
   function(X)round(stat.desc(X),2))
#The output shows that there are 25 observations within the Baseline variable 
#for Group 1, with no null or N/A values. The minimum value is 47 and the 
#maximum value is 85, resulting in a range of 38. The median value is 64 and 
#the mean is 64.84. The median and mean values are very similar, hinting that 
#this data may be normally distributed. The variance is 114.06 units squared 
#and the standard deviation is 10.68. Given the summary, the mean value of 64.84
#best represents the data, showing that the average mean baseline in Group 1 is
#about 65 text messages, with a standard deviation of 10.68 texts.

#The Group 2 output shows that there are 25 observations within the Baseline 
#variable, with no null or N/A values. The minimum value is 46 and the 
#maximum value is 89, resulting in a range of 43. The median value is 65 and 
#the mean is 65.60. The median and mean values are very similar, hinting that 
#this data may be normally distributed. The variance is 117.42 units squared 
#and the standard deviation is 10.84. Given the summary, the mean value of 65.60
#best represents the data, showing that the average mean baseline in Group 2 is
#about 66 text messages, with a standard deviation of 10.84 texts. The summary 
#statistics show that Group 2 has a slightly higher mean number of texts at
#Baseline.

#Performing descriptive statistics on the number of text messages after six 
#months stratified by group.
by(text_data$Six_months, text_data$Group, 
   function(X)round(stat.desc(X),2))
#The output shows that there are 25 observations within the Six_months variable 
#for Group 1, with no null or N/A values. The minimum value is 9 and the 
#maximum value is 78, resulting in a range of 69. The median value is 58 and 
#the mean is 52.96. The median and mean values are very similar, hinting that 
#this data may be normally distributed. The variance is 266.71 units squared 
#and the standard deviation is 16.33. Given the presence of outliers, the 
#median value of 58 best represents the data, showing that the median value 
#in Group 1 is about 58 text messages after six months.

#The Group 2 output shows that there are 25 observations within the Six_months 
#variable, with no null or N/A values. The minimum value is 46 and the 
#maximum value is 79, resulting in a range of 33. The median value is 62 and 
#the mean is 61.84. The median and mean values are very similar, hinting that 
#this data may be normally distributed. The variance is 88.56 units squared 
#and the standard deviation is 9.41. Given the summary, the mean value of 61.84
#best represents the data, showing that the average mean baseline in Group 2 is
#about 62 text messages, with a standard deviation of 9.41 texts. The summary 
#statistics show that Group 1 has a lower mean and median number of text 
#messages than Group 2 after six months.

#A comparison of Baseline and Six month summary statistics show that Group 2 
#had a higher median and mean baseline value for the number of texts, but the
#observed difference was minimal. Group 1 exhibits a higher decrease in mean 
#and median number of text messages after six months, but the observed decrease 
#in mean number of texts in Group 1 may have been skewed by the presence of 
#outliers. Group 2 has an observed decrease as well, but the decrease in mean 
#and median is less than the effect seen in Group 1.

################################################################################
## Documentation
################################################################################
##See README.md included in git repository for full documentation information
##Git repository can be found at: https://github.com/ginahird/Assignment3.git

