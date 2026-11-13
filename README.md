# BHDS 2010 - Fall 2026 - Assignment 3
README for Assignment3

November 13th, 2026

**Members:**
Gina Hird & Josue Hernandez

**Repository:**
https://github.com/ginahird/Assignment3.git

## Project Purpose:
The purpose of Assignment 3 is primarily to practice using GitHub to collaborate
on code in an RStudio Project with a Team. Each Team member was able to take a 
clearly defined role and contribute their sections through branching, committing
and pull requests. We were able to use the Assignment data, TextMessages.csv, to 
create a faceted box plot of text messages by Group and Time, a faceted bar 
chart of text messages by Group and Time, and summary statistics of text 
messages by Group and Time. The code was optimized as appropriate and partners
collaborated over Slack to have more lengthy discussions about changes and 
alignment, outside of commit and review messages. Ultimately, we were able to
create a neat, cohesive, and reproducible report for the data regarding text
messages sent across different time points in different groups.

## Direct Objective of the Data:
TextMessages.csv contains data regarding the number of text messages sent by
different participants in different groups, across different time points. Our 
objective was to present the data in two different plots, as well as output the 
descriptive statistics, and comment on any trends we noticed.

## Team Members and Roles:
**Gina Hird:**
      GitHub Repository Setup; Visualization #1 (Faceted Boxplot); README 
      Documentation; Providing Feedback to Partner
**Josue Hernandez:**
      Visualization #2 (Faceted Bar Chart); Summary Statistics; Providing
      Feedback to Partner

## Raw Data Description:
TextMessages.csv contains records at a participant level, with one record per
participant. Each participant has a text message counts for two time points, 
Baseline and Six_months. Each participant was stratified in to one of two 
groups. Text message counts were integers, ranging from 9 to 89. The data was
originally structured in wide format, with one participant per row but multiple
findings per row. We reshaped the data to long format for plotting, resulting in
multiple rows per participant but one row per finding.

## Instructions to Run the Code:
  1. In RStudio, go to File > New Project > Version Control > Git and paste
     the repository URL: https://github.com/ginahird/Assignment3.git
  2. Confirm that TextMessages.csv is in the main folder
  3. Ensure that the Assignment3.R script opens; if it is not, open it from the
     Files pane in the bottom right
  4. Install any required packages; these packages include: ggplot2, tidyr, 
     pastecs, reshape2, Hmisc. These can be easily uncommented from the top of 
     the script if they need to be run.
  5. Run the sections in order, moving through Setup, Visualization 1, 
     Visualization 2, and Summary Statistics. Each plot will output in the Plot 
     pane in the bottom right. Summary Statistics will be output to the Console.
  6. To generate the Assignment3.pdf, open Assignment3.Rmd from the File pane.
     The .Rmd contains identical code to the .R file; this file can be knit by
     clicking the "Knit" button at the top of the Script pane.
  

## Version Control Workflow:
   1. Gina created the GitHub repository "Assignment3"; the repository includes a
      .gitignore and README.md upon creation. Gina uploaded TextMessages.csv and 
      invited Josue as a collaborator.
   2. Both members cloned the repository to their respective RStudio
   3. Both members created their respective branches for their sections of the 
      project. Gina created the branches Visualization1 and Documentation. Josue
      created the branches Visualization2 and SummaryStatistics. Gina also 
      created a branch called Modifications to push other miscellaneous changes.
   4. On the Visualization1 branch, Gina read in the .csv and converted Group to 
      a factor. She then used pivot_longer() to reshape the data from a wide to
      long format. She also factored Time and applied labels for the output after
      reshaping. Then she generated a faceted boxplot, displaying each Group in a 
      different pane and the two time points for each group within the same pane.
   5. On the Visualization2 branch, Josue read in the .csv and reshaped the data
      using melt(). He then used a combination of range() and is.factor() to 
      check the data values to set appropriate values in the bar chart. He 
      originally faceted the bar chart by placing the two time points in 
      different panes and the Groups side by side in each pane. He also used
      stat_summary to apply a 95% CI error bar to each bar.
   6. On the SummaryStatistics branch, Josue originally read in the .csv data, 
      checked the structure and use a function to perform stat.desc by Group and 
      repeated the steps for each time point.
   7. Both members committed, pushed and merged changes to main in a pull 
      request. Both members assigned the other as a reviewer to approve their
      pull request.
   8. Gina then made another branch, "Modifications", for small changes. In this
      branch she created a Setup section to place all the install.package() and
      library() calls. She also placed the read.csv() and removed duplicate calls
      so that both partners call from the same data set. She removed the extra
      call and cleaned the code for these redundancies.
   9. Gina and Josue both pulled the updates from main and continued to make 
      updates in the respective branches, like adding comments on outputs, 
      renaming data sets to consolidate, and aligning outputs. Josue reworked 
      the bar plot to instead facet by Group to match the box plot faceting and
      pushed the changes. Gina also added N and n counts and pushed changes. 
      Josue was able to pull these changes and apply the same technique to his
      plot.
  10. Gina updated the README with project information, instructions to run
      and details of contributions and committed/pushed it from the Documentation 
      branch.
  11. After both partners were done making changes, Gina placed the code from 
      the .R file into a .Rmd and knit to a PDF. She then pushed both final
      files up to the repository.

## Commit and Pull Request Protocol:
Each member committed their changes as they worked through their tasks and 
included descriptive, thoughtful messages. Each member added the other as a 
reviewer to their pull request to provide feedback and/or approval. Both members
were thoughtful in committing, pushing, and pulling changes so we did not run 
into any merge conflicts.

## Summary of Results:
At Baseline, both groups sent a similar number of text messages, as depicted in 
both plots. The box plot shows what the Summary Statistics confirm, where the 
median (64 and 65 for Group 1 and 2 respectively) and mean (64.84 and 65.60 for
Group 1 and 2 respectively) are very similar. At six months, Group 1 showed a
more noticeable decrease (mean of 52.96 and 61.84 for Group 1 and 2 respectively).
Group 1 also displayed more low value outliers in at six months. The data
is paired in nature and a paired t-test within each group would be able to tell
us whether the decreases were statistically significant.

## Conclusions:
This assignment was excellent practice with branching, committing, pushing and 
pulling. We were able to perform reviews of each other's code and make updates
to align as needed. It was interesting to work with someone else, as thus far
we have only worked independently. We included an example of how individuals 
approach problems differently; on the first pass through of programming, Gina
converted data from wide to long using pivot_longer() whereas Josue used melt().
While we aligned to use the same primary data sets, we elected to leave the 
duplicate reshaping in the code just to demonstrate these different approaches.
Gina also was able to share a new skill with Josue in adding N and n counts to
outputs, as well as adding a footnote. This is a practical skill when creating
outputs and it was nice to be able to contribute to each others learning. 
Otherwise, the main takeaway is time management. This Assignment was not too 
arduous but it definitely taught us that when working in a group, time 
management is extremely important since we all have different schedules to 
consider and work around. 