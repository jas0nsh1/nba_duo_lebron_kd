setwd("~/Documents/Basketball Data")


library(ggplot2)
library(dplyr)
library(readr)

lebron_data <- read_csv("lebron_shot_locations.csv")

ggplot(lebron_data, aes(x = converted_x, y = converted_y)) +
  stat_density_2d(aes(fill = ..level..), geom = "polygon", contour = TRUE) +
  scale_fill_gradient(low = "white", high = "red") +
  coord_fixed() +
  labs(
    title = "LeBron James Shot Heat Map 2017-2018",
    x = "Court Width (ft)",
    y = "Court Length (ft)"
  ) +
  theme_minimal(base_size = 14)

# Read in your CSV (update with your actual file path if needed)
lebron_data <- read_csv("lebron_2018_2019_shot_locations.csv")

# Plot the heat map using converted_x and converted_y
ggplot(lebron_data, aes(x = converted_x, y = converted_y)) +
  stat_density_2d(aes(fill = ..level..), geom = "polygon", contour = TRUE) +
  scale_fill_gradient(low = "white", high = "red") +
  coord_fixed() +
  labs(
    title = "LeBron James Shot Heat Map 2018-2019",
    x = "Court Width (ft)",
    y = "Court Length (ft)"
  ) +
  theme_minimal(base_size = 14)

lebron_data <- read_csv("lebron_2019_2020_partial_shots.csv")

ggplot(lebron_data, aes(x = converted_x, y = converted_y)) +
  stat_density_2d(aes(fill = ..level..), geom = "polygon", contour = TRUE) +
  scale_fill_gradient(low = "white", high = "red") +
  coord_fixed() +
  labs(
    title = "LeBron James Shot Heat Map 2019-2020",
    x = "Court Width (ft)",
    y = "Court Length (ft)"
  ) +
  theme_minimal(base_size = 14)


