#Q1. Load the IPL dataset into R.

#Q2.Display the first 10 rows.
head(Batting_bowling_ipl_bat_Dataset, 10)

#Q3. Find the top 5 players with the highest total runs.
top5_runs <- Batting_bowling_ipl_bat_Dataset[order(-Batting_bowling_ipl_bat_Dataset$Runs), ][1:5, ]
top5_runs


#Q4. Find the player with the highest batting average.
highest_avg_player <- Batting_bowling_ipl_bat_Dataset[which.max(Batting_bowling_ipl_bat_Dataset$Average), ]
highest_avg_player

#Q5. Create a bar chart for the top 10 players by strike rate.
library(dplyr)
library(ggplot2)

# Get Top 10 Players by Strike Rate
top10_strike <- Batting_bowling_ipl_bat_Dataset %>%
  arrange(desc(SR)) %>%
  head(10)

# Create Bar Chart
ggplot(top10_strike, aes(x = reorder(Name, SR), y = SR, fill = Name)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(
    title = "Top 10 Players by Strike Rate",
    x = "Player",
    y = "Strike Rate"
  ) +
  theme_minimal()



#Q7. Find the correlation between matches played and runs scored.
correlation <- cor(Batting_bowling_ipl_bat_Dataset$Runs,
                   Batting_bowling_ipl_bat_Dataset$SR,
                   use = "complete.obs")

print(paste("Correlation between Runs and Strike Rate:", round(correlation, 3)))

