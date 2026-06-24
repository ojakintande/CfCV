x <- seq(-3, 3, length=1000)
y = dnorm(x, mean = 0, sd = 0.95, log = FALSE)

plot(x,y, type = "l", lwd = 4, axes = FALSE, xlab = "", ylab = "", col = 'black')
axis(1, at = -3:3, labels = c("-1", "", "-0.2 Omega", "0", "", "0.2 Omega", "1"))

segments(x0=0,y0=0,x1=0,y1=0.418,col="red",lwd = 4)

segments(x0=1,y0=0,x1=1,y1=0.24,col="red",lwd = 4)
segments(x0=-1,y0=0,x1=-1,y1=0.24,col="red",lwd = 4)

segments(x0=1.25,y0=0,x1=1.25,y1=0.18,col="blue",lwd = 4)
segments(x0=-1.25,y0=0,x1=-1.25,y1=0.18,col="blue",lwd = 4)

segments(x0=1.5,y0=0,x1=1.5,y1=0.12,col="blue",lwd = 4)
segments(x0=-1.5,y0=0,x1=-1.5,y1=0.12,col="blue",lwd = 4)

segments(x0=1.75,y0=0,x1=1.74,y1=0.08,col="blue",lwd = 4)
segments(x0=-1.75,y0=0,x1=-1.75,y1=0.08,col="blue",lwd = 4)

segments(x0=2,y0=0,x1=2,y1=0.042,col="blue",lwd = 4)
segments(x0=-2,y0=0,x1=-2,y1=0.042,col="blue",lwd = 4)

segments(x0=2.25,y0=0,x1=2.25,y1=0.022,col="blue",lwd = 4)
segments(x0=-2.25,y0=0,x1=-2.25,y1=0.022,col="blue",lwd = 4)

segments(x0=2.5,y0=0,x1=2.5,y1=0.015,col="blue",lwd = 4)
segments(x0=-2.5,y0=0,x1=-2.5,y1=0.015,col="blue",lwd = 4)

legend("topright", legend=c("Rejection region", "Acceptance region"),
       col=c("blue", "red"), lty=c(1,1),lwd = 2,cex=1)

#text(2, 0.15, "Acceptance region",adj = 0.28, col="red")
#text(-2, 0.15, "Acceptance region",adj = 0.70, col="red")
# ---- Part II

set.seed(3)
y <- rnorm(1000, 0,1)

# Density estimation
den <- density(y)

# Plot
plot(den)

# Fill area for values greater or equal to 1
value <- 1

polygon(c(den$x[den$x >= value ], value),
        c(den$y[den$x >= value ], 0),
        col = "slateblue1",
        border = 1)