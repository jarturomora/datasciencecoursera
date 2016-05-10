######################
# Part 1: Simulation #
######################

# Simulation settings
lambda = 0.2
num_samples = 40
num_simulations = 1000

# Simulate exponentials
simulated_exp <- replicate(num_simulations, rexp(num_samples, lambda))
# Calculate the mean of exponentials
mean_exp <- apply(simulated_exp, 2, mean)
# Sample Mean versus Theoretical Mean
sample_mean <- mean(mean_exp)
print(paste("Sample Mean: ", sample_mean))
theoretical_mean <- 1/lambda
print(paste("Theoretical Mean: ", theoretical_mean))
# Means visualization
hist(mean_exp, xlab = "Mean", main = "Radom Exponential Simulations")
abline(v = sample_mean, col = "red", lwd = 3)
abline(v = theoretical_mean, col = "blue", lwd = 2)
# Sample Variance versus Theoretical Variance
sample_variance <- sd(mean_exp)^2
print(paste("Sample Variance: ", sample_variance))
theoretical_variance <- ((1/lambda) * (1/sqrt(num_samples)))^2
print(paste("Theoretical Variance: ", theoretical_variance))
# Aproximation to normal distribution
x <- seq(min(mean_exp), max(mean_exp), length = 100)
y <- dnorm(x, mean = 1/lambda, sd = (1/lambda) * (1/sqrt(num_samples)))
hist(mean_exp, breaks = num_samples, prob = T, col = "blue", xlab = "Means", ylab = "Density", main = "Density of Means")
lines(x, y, col = "red", lty = 5, lwd = 3)