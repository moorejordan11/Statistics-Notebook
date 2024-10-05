library(tidyverse)
library(mosaic)

# ?KidsFeet
# table(KidsFeet$sex)
# table(KidsFeet$biggerfoot)
# table(KidsFeet$name)
# table(KidsFeet$birthmonth)
# table(KidsFeet$sex, KidsFeet$domhand)

# KidsFeet %>%
#   group_by(sex) %>%
#   summarise(min = min(length), Q1 = quantile(length)[2], median = median(length), Q3 = quantile(length)[3], max = max(length), 
#             mean = mean(length), sd = sd(length), n = n())

# ?airquality

# airquality %>%
#   group_by(Month) %>%
#   summarise(mean = mean(Temp, na.rm = TRUE), sd = sd(Temp, na.rm = TRUE), n = n())
# The na.rm = True means that if any values are na then it is skipped over and only calculate non missing values.

# hist(airquality$Temp, xlab="Daily Temperature", main="LaGuardia Airport (May to September 1973)", col="slategray")

# plot(Temp ~ Month, data=airquality, xlab="Month", ylab="Temperature", main="LaGuardia Airport (May to September 1973)", pch=16, col="slategray")

# boxplot(Temp ~ Month, data=airquality, xlab="Month", ylab="Temperature", main="LaGuardia Airport (May to September 1973)", pch=16, col="slategray")


# stripchart(Temp ~ Month, data=airquality, ylab="Month", xlab="Temperature", main="LaGuardia Airport (May to September 1973)", pch=16, col="slategray", method="stack")


# plot(Temp ~ Day, data=airquality, xlab="Day of the Month", ylab="Temperature", main="LaGuardia Airport (May to September 1973)", pch=16, col="slategray")

# ?Orange
# View(Orange)

# Orange %>% 
#   group_by(age) %>% 
#   summarise(avesize = median(circumference))

# plot(circumference ~ age, data=Orange, ylab="Trunk Circumference (mm)", xlab="Age of Trees (days)", main="Trunk Circumference of Orange Trees", col="ivory3", pch=15)
# Orange.m <- median(circumference ~ age, data=Orange)
# lines(names(Orange.m), Orange.m, col="ivory3")
# legend("topleft", legend="Median Growth", lty=1, col='ivory3', bty='n')

# boxplot(circumference ~ age, data=Orange, ylab="Trunk Circumference (mm)", xlab="Age of Trees (days)", main="Trunk Circumference of Orange Trees", col="ivory3")

# stripchart(circumference ~ age, data=Orange, ylab="Trunk Circumference (mm)", xlab="Age of Trees (days)", main="Trunk Circumference of Orange Trees", col="ivory3", pch=15, method="stack", vertical=TRUE)

# library(mosaicData)
# 
# ?Riders
# View(Riders)

# Riders %>% 
#   group_by(day) %>% 
#   summarise(sum = sum(riders))

# View(mtcars)
# ?mtcars

# mtcars %>% 
#   filter(cyl == 8) %>% 
#   group_by(am) %>% 
#   summarise(mean = mean(qsec))

# mtcars %>%
#   group_by(am) %>%
#   summarise(meam = mean(hp))

# ggplot(mtcars, aes(x=qsec, y=carb)) + geom_point()

# palette(c("skyblue","firebrick"))
# 
# plot(mpg ~ qsec, data=mtcars, col=as.factor(am), pch=16, xlab="Quarter Mile Time (seconds)", ylab="Miles per Gallon", main="1974 Motor Trend Vehicles")
# legend("topright", pch=16, legend=c("automatic","manual"), title="Transmission", bty='n', col=palette())
