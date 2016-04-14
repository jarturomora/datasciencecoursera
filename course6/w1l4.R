# Using manipulate
library(manipulate)
library(ggplot2)
library(HistData) # This is necessary to use the "Galton" dataset
myHist <- function (mu) {
    data(Galton)
    g <- ggplot(Galton, aes(x = child))
    g <- g + geom_histogram(fill = "salmon", binwidth = 1,
        aes(y = ..density..), colour = "black")
    g <- g + geom_density(size = 2)
    g <- g + geom_vline(xintercept = mu, size = 2)
    mse <- round(mean((Galton$child - mu)^2), 3)
    g <- g + labs(title = paste('mu = ', mu, ' MSE = ', mse))
    g
}
manipulate(myHist(mu), mu = slider(62, 74, step = 0.5))