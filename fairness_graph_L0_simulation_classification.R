
y = c(0.0, 0.09, 0.1, 0.2, 0.3, 0.5)
y = c('a','b','c','d','e','f')
x = c(50,100,200,500,1000,2000)
#++ Cvs
CV = rep(c('Vfold','HoldOut'),each = 6)
m = rep(c('50','100','200','500','1000','2000'),2)

#+++B-W
#CfCV = c(0.00,0.00,0.00,0.00,0.02,0.01)
Vfold = c(0.00,0.00,0.00,0.00,0.00,0.00)
#DSGCV = c(0.00,0.00,0.00,0.00,0.00,0.00)
Hold = c(0.20,0.00,0.00,0.03,0.01,0.01)


#++++
par(oma=c(0, 0, 0, 6))
plot(x,Vfold, type="b", col="red", lwd=1, pch=1, xlab="Training Instances", ylab="FIC", 
ylim=range(0,0.33), main = 'Fairness Information Criterion Graph')
#lines(x, Vfold, type="o", col="red", lwd=1, pch=2)
#lines(x, DSGCV, type="c", col="blue", lwd=1, pch=3)
lines(x, Hold, type="l", col="blue", lwd=1, pch=4)
legend(par('usr')[2], par('usr')[4], bty='n', xpd=NA,
       c("Vfold", "Hold out"),
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
c("L0 - Fairness Metric", "F[Black - White]"),
cex = 0.60)

###################################################################

#+++B-N
#CfCV = c(0.06,0.00,0.00,0.01,0.01,0.01)
Vfold = c(0.00,0.00,0.00,0.00,0.00,0.00)
#DSGCV = c(0.00,0.00,0.00,0.00,0.00,0.00)
Hold = c(0.14,0.00,0.01,0.03,0.00,0.01)


#++++
par(oma=c(0, 0, 0, 6))
plot(x,Vfold, type="b", col="red", lwd=1, pch=1, xlab="Training Instances", ylab="FIC", 
ylim=range(0,0.33), main = 'Fairness Information Criterion Graph')
#lines(x, Vfold, type="o", col="red", lwd=1, pch=2)
#lines(x, DSGCV, type="c", col="blue", lwd=1, pch=3)
lines(x, Hold, type="l", col="blue", lwd=1, pch=4)
legend(par('usr')[2], par('usr')[4], bty='n', xpd=NA,
       c("Vfold", "Hold out"),
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
c("L0 - Fairness Metric", "F[Black - Others (Natives)]"),
cex = 0.60)

###################################################################

#+++W-N
#CfCV = c(0.06,0.00,0.00,0.01,0.01,0.00)
Vfold = c(0.00,0.00,0.00,0.00,0.00,0.01)
#DSGCV = c(0.00,0.00,0.00,0.00,0.00,0.00)
Hold = c(0.06,0.00,0.01,0.00,0.01,0.00)


#++++
par(oma=c(0, 0, 0, 6))
plot(x,Vfold, type="b", col="red", lwd=1, pch=1, xlab="Training Instances", ylab="FIC", 
ylim=range(0,0.33), main = 'Fairness Information Criterion Graph')
#lines(x, Vfold, type="o", col="red", lwd=1, pch=2)
#lines(x, DSGCV, type="c", col="blue", lwd=1, pch=3)
lines(x, Hold, type="l", col="blue", lwd=1, pch=4)
legend(par('usr')[2], par('usr')[4], bty='n', xpd=NA,
       c("Vfold", "Hold out"),
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
c("L0 - Fairness Metric", "F[White - Others (Natives)]"),
cex = 0.60)

