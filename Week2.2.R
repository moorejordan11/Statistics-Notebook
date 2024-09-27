
library(ggplot2)
data(airquality)  # This loads the airquality dataset

#ggplot(airquality, aes(x = Wind)) +
  #geom_histogram(binwidth = 2, fill = "steelblue", color = "black") +
  #labs(title = "Histogram of Wind Speeds",
       #x = "Wind Speed",
       #y = "Frequency")

ggplot(airquality, aes(x = factor(Month), y = Wind)) +
  geom_boxplot(fill = "steelblue1", color = "black") +
  labs(
    title = "LaGuardia Airport Daily Mean Temperature",
    x = "Month of the Year",
    y = "Daily Mean Temperature"
  )

# Box plot for multiple colors__________________________

# Define your custom colors
custom_colors <- c("steelblue1", "steelblue2", "steelblue3", "steelblue4","blue1")

ggplot(airquality, aes(x = factor(Month), y = Wind, fill = factor(Month))) +
  geom_boxplot(color = "black") +
  labs(
    title = "LaGuardia Airport Wind Speed by Month",
    x = "Month of the Year",
    y = "Wind Speed"
  ) +
  scale_fill_manual(values = custom_colors) +
  theme(legend.position = "none")
#______________________________________________________


# library(ggplot2)
# library(dplyr)
# 
# # Filter for August data and create the plot
# august_wind <- airquality %>%
#   filter(Month == 8)
# 
# ggplot(august_wind, aes(x = Wind)) +
#   geom_histogram(binwidth = 1, fill = "steelblue", color = "black") +
#   geom_vline(xintercept = quantile(august_wind$Wind, 0.25), color = "red", linetype = "dashed") +
#   labs(title = "Distribution of Wind Speeds in August",
#        x = "Wind Speed (mph)",
#        y = "Frequency")
# 
# # Calculate the first quartile (25th percentile) of Wind speeds in August
# q1_wind <- quantile(august_wind$Wind, 0.25)
# print(paste("The first quartile of wind speeds in August is:", round(q1_wind, 1), "mph"))

#__________________________________________________________________________________________

library(ggplot2)

ggplot(airquality,aes(x=Temp,y=Ozone)) +
  geom_point(color = "steelblue") +
  labs(title="LaGuardia Airport Ozone Concentration vs. Temperature",
       x="Temperature (F)",
       y="Ozone (ppb)")

