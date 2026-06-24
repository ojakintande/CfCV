setwd("C:/Users/t-oakintande/OneDrive/2021/2021_DropBox/My_PhD_work/PhD_write_up/Results/Graphs_pdf/New_Graphs")

myresult = read.csv('graph.csv')

#
Scheme=c(rep("Validation" , 14) , rep("Training" , 14) )

#-- CVs
CfCV = myresult[,3]
HoldOut = myresult[,4]
VfoldCV = myresult[,5]
DSGCV = myresult[,6]

#-- Learning
#- L1
CfCVL1Val = myresult[1:14,3]
CfCVL1Tra = myresult[15:28,3]
HoldOutL1Val = myresult[1:14,4]
HoldOutL1Tra = myresult[15:28,4]
VfoldCVL1Val = myresult[1:14,5]
VfoldCVL1Tra = myresult[15:28,5]
DSGCVL1Val = myresult[1:14,6]
DSGCVL1Tra = myresult[15:28,6]

#-L2
CfCVL2Val = myresult[29:42,3]
CfCVL2Tra = myresult[43:56,3]
HoldOutL2Val = myresult[29:42,4]
HoldOutL2Tra = myresult[43:56,4]
VfoldCVL2Val = myresult[29:42,5]
VfoldCVL2Tra = myresult[43:56,5]
DSGCVL2Val = myresult[29:42,6]
DSGCVL2Tra = myresult[43:56,6]

#-Up
CfCVupVal = myresult[57:70,3]
CfCVupTra = myresult[71:84,3]
HoldOutupVal = myresult[57:70,4]
HoldOutupTra = myresult[71:84,4]
VfoldCVupVal = myresult[57:70,5]
VfoldCVupTra = myresult[71:84,5]
DSGCVupVal = myresult[57:70,6]
DSGCVupTra = myresult[71:84,6]

data1 = data.frame(Scheme,CfCV,HoldOut, VfoldCV)
bind <- aggregate(cbind(CfCV,HoldOut, VfoldCV)~Scheme , data=data1 , median)

#----------------------------------------------------------------
#----------------  		Box plot 	-----------------------
#setwd("C:/Users/AojSoft/Dropbox/2021/My_PhD_work/PhD_write_up/Results/New_Graphs")
#----------------------------------------------------------------
par(mfrow=c(1,2))
TrUpMse = data.frame(CfCVupTra,HoldOutupTra,VfoldCVupTra)
names(TrUpMse) = c('CfCV','Hold Out CV','V-fold CV')
boxplot(TrUpMse, col = c('purple',2,3,4), main = "L0 -Training",
        xlab = 'CVs', ylab = 'L0 RMSEs')

TrL1Mse = data.frame(CfCVL1Tra,HoldOutL1Tra,VfoldCVL1Tra)
names(TrL1Mse) = c('CfCV','Hold Out CV','V-fold CV')
boxplot(TrL1Mse, col = c('purple',2,3,4), main = "L1 - Training",xlab = 'CVs', ylab = 'L1 RMSEs')

TrL2Mse = data.frame(CfCVL2Tra,HoldOutL2Tra,VfoldCVL2Tra,DSGCVL2Tra)
names(TrL2Mse) = c('CfCV','Hold Out CV','V-fold CV','DSGCV')
boxplot(TrL2Mse, col = c('purple',2,3,4), main = "Training scheme",xlab = 'CVs', ylab = 'L2 RMSEs')

#-- Test

par(mfrow=c(1,2))
TeUpMse = data.frame(CfCVupVal,HoldOutupVal,VfoldCVupVal)
names(TeUpMse) = c('CfCV','Hold Out CV','V-fold CV')
boxplot(TeUpMse, col = c('purple',2,3,4), main = "Validation scheme",
        xlab = 'CVs', ylab = 'L0 RMSEs')

TeL1Mse = data.frame(CfCVL1Val,HoldOutL1Val,VfoldCVL1Val)
names(TeL1Mse) = c('CfCV','Hold Out CV','V-fold CV')
boxplot(TeL1Mse, col = c('purple',2,3,4), main = "Validation scheme",xlab = 'CVs', ylab = 'L1 RMSEs')

TeL2Mse = data.frame(CfCVL2Val,HoldOutL2Val,VfoldCVL2Val,DSGCVL2Val)
names(TeL2Mse) = c('CfCV','Hold Out CV','V-fold CV','DSGCV')
boxplot(TeL2Mse, col = c('purple',2,3,4), main = "Validation scheme",xlab = 'CVs', ylab = 'L2 RMSEs')

TrCfCv = data.frame(CfCVupTra,CfCVL1Tra)#,CfCVL2Tra)
TeCfCv = data.frame(CfCVupVal,CfCVL1Val)#,CfCVL2Val)
TrHold = data.frame(HoldOutupTra,HoldOutL1Tra)#,HoldOutL2Tra)
TeHold = data.frame(HoldOutupVal,HoldOutL1Val)#,HoldOutL2Val)
TrVfold = data.frame(VfoldCVupTra,VfoldCVL1Tra)#,VfoldCVL2Tra)
TeVfold = data.frame(VfoldCVupVal,VfoldCVL1Val)#,VfoldCVL2Val)
TrDSG = data.frame(DSGCVupTra,DSGCVL1Tra)#,DSGCVL2Tra)
TeDSG = data.frame(DSGCVupVal,DSGCVL1Val)#,DSGCVL2Val)

par(mfrow=c(1,3))
boxplot(TrCfCv, col = c('purple',2,3,4), main = "Training CfCV",xlab = 'CVs', ylab = 'RMSEs')
boxplot(TeCfCv, col = c('purple',2,3,4), main = "Validation CfCV",xlab = 'CVs', ylab = 'RMSEs')
par(mfrow=c(1,2))
boxplot(TrHold, col = c('purple',2,3,4), main = "Training Hold Out",xlab = 'CVs', ylab = 'RMSEs')
boxplot(TeHold, col = c('purple',2,3,4), main = "Validation Hold Out",xlab = 'CVs', ylab = 'RMSEs')
par(mfrow=c(1,2))
boxplot(TrVfold, col = c('purple',2,3,4), main = "Training V-fold",xlab = 'CVs', ylab = 'RMSEs')
boxplot(TeVfold, col = c('purple',2,3,4), main = "Validation V-fold",xlab = 'CVs', ylab = 'RMSEs')
par(mfrow=c(1,2))
boxplot(TrDSG, col = c('purple',2,3,4), main = "Training scheme",xlab = 'CVs', ylab = 'RMSEs')
boxplot(TeDSG, col = c('purple',2,3,4), main = "Validation scheme",xlab = 'CVs', ylab = 'RMSEs')

####

d = data.frame(TrCfCv,TrHold,TrVfold)
boxplot(d)


#-- Barplots unpenalized

CfCVupVal = myresult[57:70,3]
CfCVupTra = myresult[71:84,3]
CfCV = myresult[57:84,3]
HoldOutupVal = myresult[57:70,4]
HoldOutupTra = myresult[71:84,4]
HoldOut = myresult[57:84,4]
VfoldCVupVal = myresult[57:70,5]
VfoldCVupTra = myresult[71:84,5]
VfoldCV = myresult[57:84,5]
DSGCVupVal = myresult[57:70,6]
DSGCVupTra = myresult[71:84,6]
DSGCV = myresult[57:84,6]

data1 = data.frame(Scheme,CfCV,HoldOut, VfoldCV)
bind <- aggregate(cbind(CfCV,HoldOut, VfoldCV)~Scheme , data=data1 , mean)
rownames(bind) <- bind[,1]
bind <- as.matrix(bind[,-1])

#Plot boundaries
lim <- 1.2*max(bind)
#A function to add arrows on the chart
error.bar <- function(x, y, upper, lower=upper, length=0.1,...){
  arrows(x,y+upper, x, y-lower, angle=90, code=3, length=length, ...)
}
#Then I calculate the standard deviation for each specie and condition :
stdev <- aggregate(cbind(CfCV,HoldOut, VfoldCV)~Scheme , data=data1, sd)
rownames(stdev) <- stdev[,1]
stdev <- as.matrix(stdev[,-1]) * 1.96 / 10
par(oma=c(0, 0, 0, 6)) 
#I am ready to add the error bar on the plot using my "error bar" function !

#par(oma=c(0, 0, 0, 5.5))
#ze_barplot <- barplot(bind , beside=T , legend.text=T,col=c("sky blue" , "magenta"), main = 'L0 Learning', ylim=c(0,lim) , ylab="RMSE", xlab = "CVs")
ze_barplot <- barplot(bind , beside=T ,col=c("sky blue" , "magenta"), main = 'L0 - Learning', ylim=c(0,lim) , ylab="RMSE", xlab = "CVs")

error.bar(ze_barplot,bind, stdev)
legend(par('usr')[2], par('usr')[2], bty='n', xpd=NA,
       c("CfCV = [0.9729,0.8843]", "HoldOut = [0.9979,4.6929]","Vfold = [7.7164,0.9814]"),
       cex = 0.65)

legend('topleft', legend=c('Training', 'Validation'), col=c("sky blue" , "magenta"),bg ="yellow" , lty=1)


# --- L1

CfCVL1Val = myresult[1:14,3]
CfCVL1Tra = myresult[15:28,3]
CfCV = myresult[1:28,3]
HoldOutL1Val = myresult[1:14,4]
HoldOutL1Tra = myresult[15:28,4]
HoldOut = myresult[1:28,4]
VfoldCVL1Val = myresult[1:14,5]
VfoldCVL1Tra = myresult[15:28,5]
VfoldCV = myresult[1:28,5]
DSGCVL1Val = myresult[1:14,6]
DSGCVL1Tra = myresult[15:28,6]
DSGCV = myresult[1:28,6]

data2 = data.frame(Scheme,CfCV,HoldOut, VfoldCV)
bind2 <- aggregate(cbind(CfCV,HoldOut, VfoldCV)~Scheme , data=data2 , mean)


rownames(bind2) <- bind2[,1]
bind2 <- as.matrix(bind2[,-1])

#A function to add arrows on the chart
error.bar <- function(x, y, upper, lower=upper, length=0.1,...){
  arrows(x,y+upper, x, y-lower, angle=90, code=3, length=length, ...)
}
stdev2 <- aggregate(cbind(CfCV,HoldOut, VfoldCV)~Scheme , data=data2, sd)
rownames(stdev2) <- stdev2[,1]
stdev2 <- as.matrix(stdev2[,-1]) * 1.96 / 10
lim2 <- 1.2*max(bind2)
#--error bar
par(oma=c(0, 0, 0, 5.5))
#ze_barplot2 <- barplot(bind2, beside=T , legend.text=T,col=c("sky blue" , "magenta"), main = 'L1 Learning', ylim=c(0,lim2) , ylab="RMSE", xlab = "CVs")
ze_barplot2 <- barplot(bind2, beside=T ,col=c("sky blue" , "magenta"), main = 'L1 Learning', ylim=c(0,lim2) , ylab="RMSE", xlab = "CVs")

error.bar(ze_barplot2,bind2, stdev2)
legend(par('usr')[2], par('usr')[1], bty='n', xpd=NA,
       c("CfCV = [1.4907,1.3636]", "HoldOut = [1.5407,1.5693]","Vfold = [1.5257,1.4879]"),
       cex = 0.65)
legend('topleft', legend=c('Training', 'Validation'), col=c("sky blue" , "magenta"),bg ="yellow" , lty=1)

################################################################################


### process plot - Bars
myresult
#
Scheme=c(rep("CfCV" , 14) ,rep("HoldOut" , 14),rep("VfoldCV" , 14) )

cvs_Train = c(CfCV[1:14],HoldOut[1:14],VfoldCV[1:14])
cvs_Test = c(CfCV[15:28],HoldOut[15:28],VfoldCV[15:28])


# ---

CfCVL2Val = myresult[29:42,3]
CfCVL2Tra = myresult[43:56,3]
CfCV = myresult[29:56,3]
HoldOutL2Val = myresult[29:42,4]
HoldOutL2Tra = myresult[43:56,4]
HoldOut = myresult[29:56,4]
VfoldCVL2Val = myresult[29:42,5]
VfoldCVL2Tra = myresult[43:56,5]
VfoldCV = myresult[29:56,5]
#---
Scheme=c(rep("CfCV" , 14) , rep("HoldOut CV" , 14),rep("VfoldCV" , 14))

cvs_Trainup =c(myresult[71:84,3],myresult[71:84,4],myresult[71:84,5])#,myresult[71:84,6])
cvs_Testup =c(myresult[57:70,3],myresult[57:70,4],myresult[57:70,5])#,myresult[57:70,6])

cvs_TestL1 =c(myresult[1:14,3],myresult[1:14,4],myresult[1:14,5])#,myresult[1:14,6])
cvs_TrainL1 =c(myresult[15:28,3],myresult[15:28,4],myresult[15:28,5])#,myresult[15:28,6])

cvs_TrainL2 =c(myresult[43:56,3],myresult[43:56,4],myresult[43:56,5])#,myresult[43:56,6])
cvs_TestL2 =c(myresult[29:42,3],myresult[29:42,4],myresult[29:42,5])#,myresult[29:42,6])


#--------------------------------------------------------------------

data1 = data.frame(Scheme,cvs_Trainup)
bind <- aggregate(cvs_Trainup~Scheme , data=data1 , mean)

rownames(bind) <- bind[,1]
bind <- as.matrix(bind[,-1])
rownames(bind) = c('CfCV','HoldOut CV', 'VfoldCV')

#Plot boundaries
lim <- 1.2*max(bind)

#A function to add arrows on the chart
error.bar <- function(x, y, upper, lower=upper, length=0.1,...){
  arrows(x,y+upper, x, y-lower, angle=90, code=3, length=length, ...)
}

#Then I calculate the standard deviation for each specie and condition :
stdev <- aggregate(cvs_Trainup~Scheme , data=data1, sd)
rownames(stdev) <- stdev[,1]
stdev <- as.matrix(stdev[,-1]) * 1.96 / 10
par(oma=c(0, 0, 0, 6)) 
par(mfrow=c(1,2))
#par(oma=c(0, 0, 0, 5.5))
ze_barplot <- barplot(bind , beside=T,col=c("green","magenta","navy blue"), main = 'L0 - Training output', ylim=c(0,lim) , ylab="RMSE", xlab = "CVs")
error.bar(ze_barplot,bind, stdev)
legend("topleft", c("CfCV", "Hold out","V-fold"),bty='n', xpd=NA,
       col = c("green","magenta","navy blue"), lty = c(1, 1,1))
legend(par('usr')[2], par('usr')[2], bty='n', xpd=NA,
       c("CfCV = [0.9729]", "HoldOut = [0.9979]","Vfold = [7.7164]"),
       cex = 0.65)

#------

data2 = data.frame(Scheme,cvs_Testup)
bind2 <- aggregate(cvs_Testup~Scheme , data=data2 , mean)

rownames(bind2) <- bind2[,1]
bind2 <- as.matrix(bind2[,-1])
rownames(bind2) = c('CfCV','HoldOut CV', 'VfoldCV')

#Plot boundaries
lim <- 1.2*max(bind2)

#A function to add arrows on the chart
error.bar2 <- function(x, y, upper, lower=upper, length=0.1,...){
  arrows(x,y+upper, x, y-lower, angle=90, code=3, length=length, ...)
}

#Then I calculate the standard deviation for each specie and condition :
stdev2 <- aggregate(cvs_Testup~Scheme , data=data2, sd)
rownames(stdev) <- stdev2[,1]
stdev2 <- as.matrix(stdev2[,-1]) * 1.96 / 10
#par(oma=c(0, 0, 0, 6)) 
par(oma=c(0, 0, 0, 5.5))
ze_barplot2 <- barplot(bind2 , beside=T,col=c("green","magenta","navy blue"), main = 'L0 - Validation output', ylim=c(0,lim), xlab = "CVs")
error.bar(ze_barplot2,bind2, stdev2)
legend("topright", c("CfCV", "Hold out","V-fold"),bty='n', xpd=NA,
       col = c("green","magenta","navy blue"), lty = c(1, 1,1))
legend(par('usr')[2], par('usr')[2], bty='n', xpd=NA,
       c("CfCV = [0.8843]", "HoldOut = [4.6929]","Vfold = [0.9814]"),
       cex = 0.65)


#--- L1

# --- L1
Scheme=c(rep("CfCV" , 14) , rep("DSGCV" , 14),rep("HoldOut" , 14),rep("VfoldCV" , 14) )

data3 = data.frame(Scheme,cvs_TrainL1)
bind3 <- aggregate(cvs_TrainL1~Scheme , data=data3 , mean)

rownames(bind3) <- bind3[,1]
bind3 <- as.matrix(bind3[,-1])
rownames(bind3) = c('CfCV','DSGCV','HoldOut', 'VfoldCV')

#Plot boundaries
lim <- 1.2*max(bind3)

#A function to add arrows on the chart
error.bar <- function(x, y, upper, lower=upper, length=0.1,...){
  arrows(x,y+upper, x, y-lower, angle=90, code=3, length=length, ...)
}

#Then I calculate the standard deviation for each specie and condition :
stdev3 <- aggregate(cvs_TrainL1~Scheme , data=data3, sd)
rownames(stdev) <- stdev3[,1]
stdev3 <- as.matrix(stdev3[,-1]) * 1.96 / 10
#par(oma=c(0, 0, 0, 6)) 
par(mfrow=c(1,2))
par(oma=c(0, 0, 0, 5.5))
ze_barplot <- barplot(bind3, beside=T,col=c("green","magenta","navy blue","sky blue"), main = 'L1 - Training output', ylim=c(0,lim) , ylab="RMSE", xlab = "CVs")
error.bar(ze_barplot,bind3, stdev3)
legend("topleft",horiz = T, c("CfCV", "DSGCV", "Hold out","V-fold"),bty='n', xpd=NA,
       col = c("green","magenta","navy blue","sky blue"), lty = c(1, 1,1,1))

legend(par('usr')[2], par('usr')[1], bty='n', xpd=NA,
       c("CfCV = [1.4907]", "DGS = [1.5407]", "HoldOut = [1.5257]","Vfold = [1.5071]"),
       cex = 0.65)


data4 = data.frame(Scheme,cvs_TestL1)
bind4 <- aggregate(cvs_TestL1~Scheme , data=data4, mean)

rownames(bind4) <- bind4[,1]
bind4 <- as.matrix(bind4[,-1])
rownames(bind4) = c('CfCV','DSGCV','HoldOut', 'VfoldCV')

#Plot boundaries
lim <- 1.2*max(bind4)

#A function to add arrows on the chart
error.bar2 <- function(x, y, upper, lower=upper, length=0.1,...){
  arrows(x,y+upper, x, y-lower, angle=90, code=3, length=length, ...)
}

#Then I calculate the standard deviation for each specie and condition :
stdev4 <- aggregate(cvs_TrainL1~Scheme , data=data4, sd)
rownames(stdev4) <- stdev4[,1]
stdev4 <- as.matrix(stdev4[,-1]) * 1.96 / 10
#par(oma=c(0, 0, 0, 6)) 
#par(oma=c(0, 0, 0, 5.5))
ze_barplot2 <- barplot(bind4, beside=T,col=c("green","magenta","navy blue","sky blue"), main = 'L1 - Validation output', ylim=c(0,lim), xlab = "CVs")
error.bar(ze_barplot2,bind4, stdev4)
legend("topleft",horiz = T, c("CfCV", "DSGCV", "Hold out","V-fold"),bty='n', xpd=NA,
       col = c("green","magenta","navy blue","sky blue"), lty = c(1, 1,1,1))
legend(par('usr')[2], par('usr')[1], bty='n', xpd=NA,
       c("CfCV = [1.3636]", "DGS = [1.5693]", "HoldOut = [1.4879]","Vfold = [1.5050]"),
       cex = 0.65)


# --- L2
data1 = data.frame(Scheme,cvs_TrainL2)
bind <- aggregate(cvs_TrainL2~Scheme , data=data1 , mean)

rownames(bind) <- bind[,1]
bind <- as.matrix(bind[,-1])
rownames(bind) = c('CfCV','DSGCV','HoldOut', 'VfoldCV')

#Plot boundaries
lim <- 1.2*max(bind)

#A function to add arrows on the chart
error.bar <- function(x, y, upper, lower=upper, length=0.1,...){
  arrows(x,y+upper, x, y-lower, angle=90, code=3, length=length, ...)
}

#Then I calculate the standard deviation for each specie and condition :
stdev <- aggregate(cvs_TrainL2~Scheme , data=data1, sd)
rownames(stdev) <- stdev[,1]
stdev <- as.matrix(stdev[,-1]) * 1.96 / 10
par(oma=c(0, 0, 0, 6)) 
#I am ready to add the error bar on the plot using my "error bar" function !


par(mfrow=c(1,2))
par(oma=c(0, 0, 0, 5.5))
ze_barplot <- barplot(bind , beside=T,col=c("green","magenta","navy blue","sky blue"), main = 'L2 - Training output', ylim=c(0,lim) , ylab="RMSE", xlab = "CVs")
error.bar(ze_barplot,bind, stdev)
legend("topleft",horiz = T, c("CfCV", "DSGCV", "Hold out","V-fold"),bty='n', xpd=NA,
       col = c("green","magenta","navy blue","sky blue"), lty = c(1, 1,1,1))

legend(par('usr')[2], par('usr')[1], bty='n', xpd=NA,
       c("CfCV = [1.4907]", "DGS = [1.5407]", "HoldOut = [1.5257]","Vfold = [1.5071]"),
       cex = 0.65)

data2 = data.frame(Scheme,cvs_TestL2)
bind2 <- aggregate(cvs_TestL2~Scheme , data=data2 , mean)

rownames(bind2) <- bind2[,1]
bind2 <- as.matrix(bind2[,-1])
rownames(bind2) = c('CfCV','DSGCV','HoldOut', 'VfoldCV')

#Plot boundaries
lim <- 1.2*max(bind2)

#A function to add arrows on the chart
error.bar2 <- function(x, y, upper, lower=upper, length=0.1,...){
  arrows(x,y+upper, x, y-lower, angle=90, code=3, length=length, ...)
}

#Then I calculate the standard deviation for each specie and condition :
stdev2 <- aggregate(cvs_TestL2~Scheme , data=data2, sd)
rownames(stdev) <- stdev2[,1]
stdev2 <- as.matrix(stdev2[,-1]) * 1.96 / 10

ze_barplot2 <- barplot(bind2 , beside=T,col=c("green","magenta","navy blue","sky blue"), main = 'L2 - Validation output', ylim=c(0,lim), xlab = "CVs")
error.bar(ze_barplot2,bind2, stdev2)
legend("topleft",horiz = T, c("CfCV", "DSGCV", "Hold out","V-fold"),bty='n', xpd=NA,
       col = c("green","magenta","navy blue","sky blue"), lty = c(1, 1,1,1))
legend(par('usr')[2], par('usr')[1], bty='n', xpd=NA,
       c("CfCV = [1.3629]", "DGS = [1.5793]", "HoldOut = [1.4893]","Vfold = [1.4957]"),
       cex = 0.65)

