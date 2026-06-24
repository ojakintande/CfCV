x = c(50,100,200,500,1000,2000)

#+++B-W
#CfCV = c(0.046,0.0381,0.0266,0.0292,0.00149,0.00257)
Vfold = c(0.004,0.0142,0.0073,0.00382,0.00263,0.00127)
#DSGCV = c(0.006,0.0269,0.0309,0.0270,0.00474,0.00178)
Hold = c(0.007,0.0103,0.0127,0.00377,0.0007,0.00101)


#++++
par(oma=c(0, 0, 0, 6))
plot(x,Vfold, type="b", col="red", lwd=1, pch=1, xlab="Training Instances", ylab="FIC", 
ylim=range(0,0.33), main = 'Fairness Information Criterion Graph')
#lines(x, Vfold, type="o", col="red", lwd=1, pch=2)
#lines(x, DSGCV, type="c", col="blue", lwd=1, pch=3)
lines(x, Hold, type="l", col="blue", lwd=1, pch=4)
legend(par('usr')[2], par('usr')[4], bty='n', xpd=NA,
       c("Vfold","Hold out"),
col = c("red","blue"), pch=c(1, 2), lty=c(1,2))
abline(h=0, col="black")
abline(h=0.05, col="green")
abline(h=0.10, col="purple")
abline(h=0.2, col="yellow")
abline(h=0.3, col="red")
abline(h=0.4, col="red")
text(-1, 0.025, "Optimum",adj = -4.7)
text(-1, 0.074, "Acceptable",adj = -3.5)
text(-1, 0.15, "Questionable",adj = -2.9)
text(-1, 0.25, "Unacceptable",adj = -2.8)

legend(par('usr')[2], par('usr')[3.8], bty='n', xpd=NA,
c("L1 - Fairness Metric", "F[Black - White]"),
cex = 0.60)

###################################################################

#+++B-N
#CfCV = c(0.004,0.0005,0.0076,0.0177,0.00361,0.00251)
Vfold = c(0.046,0.0158,0.011,0.00274,0.00165,0.00169)
#DSGCV = c(0.056,0.002,0.008,0.01420,0.00054,0.00157)
Hold = c(0.044,0.0176,0.0203,0.00395,0.00274,0.00198)

#++++
par(oma=c(0, 0, 0, 6))
plot(x,Vfold, type="b", col="red", lwd=1, pch=1, xlab="Training Instances", ylab="FIC", 
ylim=range(0,0.33), main = 'Fairness Information Criterion Graph')
#lines(x, Vfold, type="o", col="red", lwd=1, pch=2)
#lines(x, DSGCV, type="c", col="blue", lwd=1, pch=3)
lines(x, Hold, type="l", col="blue", lwd=1, pch=4)
legend(par('usr')[2], par('usr')[4], bty='n', xpd=NA,
       c("Vfold","Hold out"),
col = c("red","blue"), pch=c(1, 2), lty=c(1,2))
abline(h=0, col="black")
abline(h=0.05, col="green")
abline(h=0.10, col="purple")
abline(h=0.2, col="yellow")
abline(h=0.3, col="red")
abline(h=0.4, col="red")
text(-1, 0.025, "Optimum",adj = -4.7)
text(-1, 0.074, "Acceptable",adj = -3.5)
text(-1, 0.15, "Questionable",adj = -2.9)
text(-1, 0.25, "Unacceptable",adj = -2.8)

legend(par('usr')[2], par('usr')[3.8], bty='n', xpd=NA,
c("L1 - Fairness Metric", "F[Black - Others (Natives)]"),
cex = 0.60)

###################################################################

#+++W-N
#CfCV = c(0.050,0.0386,0.019,0.0115,0.00510,0.0000)
Vfold = c(0.050,0.0015,0.0037,0.0010,0.0009,0.0004)
#DSGCV = c(0.063,0.0289,0.0229,0.0128,0.0053,0.00022)
Hold = c(0.051,0.0073,0.0077,0.00018,0.00204,0.00097)


#++++
par(oma=c(0, 0, 0, 6))
plot(x,Vfold, type="b", col="red", lwd=1, pch=1, xlab="Training Instances", ylab="FIC", 
ylim=range(0,0.33), main = 'Fairness Information Criterion Graph')
#lines(x, Vfold, type="o", col="red", lwd=1, pch=2)
#lines(x, DSGCV, type="c", col="blue", lwd=1, pch=3)
lines(x, Hold, type="l", col="blue", lwd=1, pch=4)
legend(par('usr')[2], par('usr')[4], bty='n', xpd=NA,
       c("Vfold","Hold out"),
col = c("red","blue"), pch=c(1, 2), lty=c(1,2))
abline(h=0, col="black")
abline(h=0.05, col="green")
abline(h=0.10, col="purple")
abline(h=0.2, col="yellow")
abline(h=0.3, col="red")
abline(h=0.4, col="red")
text(-1, 0.025, "Optimum",adj = -4.7)
text(-1, 0.074, "Acceptable",adj = -3.5)
text(-1, 0.15, "Questionable",adj = -2.9)
text(-1, 0.25, "Unacceptable",adj = -2.8)

legend(par('usr')[2], par('usr')[3.8], bty='n', xpd=NA,
c("L1 - Fairness Metric", "F[White - Others (Natives)]"),
cex = 0.60)

