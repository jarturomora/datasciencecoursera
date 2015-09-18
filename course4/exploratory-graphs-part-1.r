# This code is used in the lesson "Exploratory Graphs"
# The file avgpm25.csv contains data about pollution in the US.
# Coded and commented by @jarturomora

# Setting the drawing area
par(mfrow=c(3,2)) # Space to show the following six graphs

#Reading the data from a CSV file.
pollution <- read.csv("data/avgpm25.csv",colClasses=c("numeric","character","factor","numeric","numeric"))
head(pollution)

# Some general stats about the pollution.
summary(pollution$pm25)

# Drawing a blox plot
boxplot(pollution$pm25, col="blue")

# Drawing a histogram with the observations bellow.
hist(pollution$pm25,col="green")
rug(pollution$pm25) #Show the observations bellow the histogram

# Drawing a histogram with 100 bars and observations bellow.
hist(pollution$pm25,col="green",breaks=100)
rug(pollution$pm25)

# Anther box plot with a useful line to add meaning to the data.
boxplot(pollution$pm25, col="blue")
abline(h=12) #This draws a line at the value of 12 that is the allowed measuete of pollution in the US.

# Showing the allowed pollution and the median in a histogram
hist(pollution$pm25,col="green")
abline(v=12,lwd=2)
abline(v=median(pollution$pm25),col="magenta",lwd=4)

# Drawing a bar plot.
barplot(table(pollution$region),col="wheat",main="Number of Counties in Each Region")