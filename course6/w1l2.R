## Week 1 - Lesson 2 ##

# Probability Density Function (PDF) for y = 2x
x <- c(-0.5, 0, 1, 1, 1.5)
y <- c(0, 0, 2, 0, 0)
plot(x, y, lwd = 3, frame = F, type = "l")

# Probability that 75% of the population fits
# Since our PDF is a triangle we can calculate this probability with its area
# funcion area = b * h / 2, where b will be 0.75
print("Calculating PDF of 75% using the triangle area formula")
b = 0.75
h = 1.5
a = b * h / 2
print(a)

print("Calculating PDF of 75% using pbeta")
print(pbeta(0.75, 2, 1))