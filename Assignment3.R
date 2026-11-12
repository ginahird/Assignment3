################################################################################
## Visualization 1
################################################################################
library(ggplot2)
library(tidyr)

#setting dataset
text_data <- read.csv("TextMessages.csv")

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





################################################################################
## Summary Statistics
################################################################################

install.packages("pastecs")

library(pastecs)

text_data <- read.csv("TextMessages.csv", header=TRUE)

head(text_data)

text_data$Group <- as.factor(text_data$Group)

by(text_data$Baseline, text_data$Group, 
   function(X)round(stat.desc(X),2))

by(text_data$Six_months, text_data$Group, 
   function(X)round(stat.desc(X),2))


################################################################################
## Documentation
################################################################################


