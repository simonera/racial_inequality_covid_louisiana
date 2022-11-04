# load ggplot 2
library(ggplot2)

# create data frame
black <- data.frame(outcome = c("Positive cases",
                                "Hospitalizations",
                                "Deaths"),
                    percent = c(47.45, 60.35, 53.2))

# plot
ggplot(data=black, aes(x = outcome, y = percent)) +
  geom_col(width=0.5) +
  geom_hline(yintercept = 32.7, 
             linetype="dashed", color = "#6699cc", size=2) +
  # scale_x_discrete reorders the columns
  scale_x_discrete(limits=c("Positive cases", "Hospitalizations", "Deaths")) +
  labs(title = "Louisiana COVID-19 Data, May 2020: Black", 
       x = "", y = "Percent of state total",
       caption = "Sources: Louisiana Department of Health; U.S. Census",
       subtitle = "The horizontal line represents the Black share of state population")

# create data frame
white <- data.frame(outcome = c("Positive cases",
                                "Hospitalizations",
                                "Deaths"),
                    percent = c(25.2, 29.32, 43.94))

# plot
ggplot(data=white, aes(x = outcome, y = percent)) +
  geom_col(width=0.5) +
  geom_hline(yintercept = 62.9, 
             linetype="dashed", color = "#6699cc", size=2) +
  scale_x_discrete(limits=c("Positive cases", "Hospitalizations", "Deaths")) +
  labs(title = "Louisiana COVID-19 Data, May 2020: White", 
       x = "", y = "Percent of state total",
       caption = "Sources: Louisiana Department of Health; U.S. Census",
       subtitle = "The horizontal line represents the White share of state population")

# create data frame
now <- data.frame(Time = rep(c("May 2020", "July 2022"), each = 2),
                  outcome = rep(c("Deaths"), 4),
                  race = rep(c("Black", "White"), 2),
                  population = rep(c(32.7, 62.9), 2),
                  percent=c(53.2, 43.94, 34.6, 63.8))

# by default, R follows alphabetic order
# July 2022 would be the first col, followed by May 2020
# to change the order, run the following code
now$Time <- factor(now$Time, levels=c("May 2020","July 2022"))

# plot 
ggplot(data = now, aes(x = outcome, y = percent, fill = Time)) +
  facet_wrap(~race) +
  geom_col(width=0.75, position = position_dodge(1)) +
  # using yintercept = population creates one horizontal line per facet
  # as a function of how I created the data frame
  # where population = 32.7 for Black
  # and population = 62.9 for White
  geom_hline(aes(yintercept = population),
             linetype="dashed", color = "#6699cc", size=2) +
  scale_fill_brewer(palette="Set2") +
  labs(title = "Louisiana COVID-19 Deaths, May 2020-July 2022, by Race", 
       x = "", y = "Percent of state total",
       caption = "Sources: Louisiana Department of Health; U.S. Census",
       subtitle = "The horizontal line represents the share of state population for each race")
