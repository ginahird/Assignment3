################################################################################
## Visualization 1
################################################################################




################################################################################
## Visualization 2
################################################################################

text_data <- read.csv("TextMessages.csv", header=TRUE)

head(text_data)

text_long <- melt(text_data, id.vars = c("Group","Participant"),
                          variable.name ="Time",
                          value.name = "Messages")
range(text_long$Messages)

text_long$Group <- as.factor(text_long$Group)

is.factor(text_long$Time)

BarWithErrors_MessageTimeByGroup <- ggplot(text_long, 
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





################################################################################
## Documentation
################################################################################


