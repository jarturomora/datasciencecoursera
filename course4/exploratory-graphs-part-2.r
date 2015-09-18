# This code is used in the lesson "Exploratory Graphs (Part 2)"
# The file avgpm25.csv contains data about pollution in the US.
# Coded and commented by @jarturomora

# Setting the graphics space
par(mfrow = c(4,2))

# Loading data for the exercises
pollution <- read.csv("data/avgpm25.csv")

# Creating a box plot with two variables, one categorical (region) and other continious (pm25).
# This plot will show the pm25 by region, this is waht the ~ means.
boxplot(pm25 ~ region, data = pollution, col = "red")

# Creating a histogram with a similar rationale than the boxplot above, but this time we create a histogram per region.
# Setting the margins for the histograms
par(mar = c(4, 4, 2, 1))
# Here we create an histogram witha subset of the data in the pollution dataframe. We select the data from
# the pm25 column where the column region is equals to "east"
hist(subset(pollution, region == "east")$pm25, col = "green")
# Adding a vertical line on 12, the maximun allow pm25 value in the US.
abline(v=12, lwd=3)
# The same as the first histogram but from the west region.
hist(subset(pollution, region == "west")$pm25, col = "green")
# Adding a vertical line on 12, the maximun allow pm25 value in the US.
abline(v=12, lwd=3)

# Creating a scatterplot with data about latitude and pm25 to observe which part is more polluted, the north or the south.
with(pollution, plot(latitude, pm25, main = "PM25 in the US - East + West"))
# Adding a horizontal line on 12, the maximun allow pm25 value in the US.
abline(h = 12, lwd = 2, lty = 2)
# Same scatterplot than before but coloring the regions
with(pollution, plot(latitude, pm25, col = region, main = "PM25 in the US - East (black) & West (red)")) #red dots are West and black dots are East
abline(h = 12, lwd = 2, lty = 2)
# Now using two scatterplots we present the same data but with a clear distinction of each region
with(subset(pollution, region = "west"), plot(latitude, pm25, main = "West", col = "Blue"))
with(subset(pollution, region = "east"), plot(latitude, pm25, main = "East", col = "Red"))