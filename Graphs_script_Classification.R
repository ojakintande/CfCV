#++ Real-life
#++++++Penalized L0
TitL0T = c(0.82,0.78,0.80)
ContL0T = c(0.69,0.68,0.69)
TitL0Te = c(0.84,0.52,0.81)
ContL0Te = c(0.77,0.67,0.69)

names(TitL0T) = c('CfCV','HoldOut','V-fold')
names(ContL0T) = c('CfCV','HoldOut','V-fold')
names(TitL0Te) = c('CfCV','HoldOut','V-fold')
names(ContL0Te) = c('CfCV','HoldOut','V-fold')


Tit = rbind(TitL0T,TitL0Te)
Cont = rbind(ContL0T,ContL0Te)

Titanic = c(0.82,0.78,0.80,0.84,0.52,0.81)
Contraceptive = c(0.69,0.68,0.69,0.77,0.67,0.69)
#++
exdata <- c(rep("Titanic Training" , 3) , rep("Titanic Validation" , 3))
exdata2 <- c(rep("Contraceptive Training" , 3) , rep("Contraceptive Validation" , 3))

cv <- rep(c("CfCV" , "HoldOut" ,"V-fold") , 2)
#cv <- c(rep("CfCV" ,3), rep("HoldOut" ,3),rep("V-fold" , 3))
data <- data.frame(exdata,cv,Titanic)
data2 = data.frame(exdata2,cv,Contraceptive)

# library
#install.packages(c('ggplot2','viridis','hrbrthemes','gridExtra'))
library(ggplot2)
library(viridis)
library(hrbrthemes)
library(gridExtra)

# Grouped
p1 = ggplot(data, aes(fill=cv, y=Titanic, x=exdata)) + 
    geom_bar(position="dodge", stat="identity")+
    scale_fill_viridis(discrete = T)+
    ggtitle("Accuracy - Titanic") +
    theme_set(theme_bw()) +
    xlab("")+
    ylab("Accuracy")
p1 = p1 + geom_text(aes(label = Titanic), vjust = -0.2, size = 3,position = position_dodge(0.9))
  
p2 = ggplot(data2, aes(fill=cv, y=Contraceptive, x=exdata2)) + 
    geom_bar(position="dodge", stat="identity") +
    scale_fill_viridis(discrete = T) +
    ggtitle("Accuracy - Contraceptive") +
    theme_set(theme_bw()) +
    xlab("")+
    ylab("Accuracy")
p2 = p2 + geom_text(aes(label = Contraceptive), vjust = -0.2, size = 3,position = position_dodge(0.9))


# Small multiple
grid.arrange(tableGrob(Tit),tableGrob(Cont),p1, p2,ncol = 2,widths = c(1, 1),
  clip = TRUE, bottom = "Training & Validation performance of the CVs [Unregularized [L0] Learner]")
#+++

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#++ Real-life
#++++++Penalized L1
TitL1T = c(0.83,0.78,0.80)
ContL1T = c(0.69,0.68,0.69)
TitL1Te = c(0.83,0.78,0.79)
ContL1Te = c(0.77,0.67,0.69)

names(TitL1T) = c('CfCV','HoldOut','V-fold')
names(ContL1T) = c('CfCV','HoldOut','V-fold')
names(TitL1Te) = c('CfCV','HoldOut','V-fold')
names(ContL1Te) = c('CfCV','HoldOut','V-fold')


Tit = rbind(TitL1T,TitL1Te)
Cont = rbind(ContL1T,ContL1Te)

Titanic = c(0.83,0.78,0.80,0.83,0.78,0.79)
Contraceptive = c(0.69,0.68,0.69,0.77,0.67,0.69)
#++
exdata <- c(rep("Titanic Training" , 3) , rep("Titanic Validation" , 3))
exdata2 <- c(rep("Contraceptive Training" , 3) , rep("Contraceptive Validation" , 3))

cv <- rep(c("CfCV" , "HoldOut" ,"V-fold") , 2)
#cv <- c(rep("CfCV" ,3), rep("HoldOut" ,3),rep("V-fold" , 3))
data <- data.frame(exdata,cv,Titanic)
data2 = data.frame(exdata2,cv,Contraceptive)

# library
#install.packages(c('ggplot2','viridis','hrbrthemes','gridExtra'))
library(ggplot2)
library(viridis)
library(hrbrthemes)
library(gridExtra)

# Grouped
p1 = ggplot(data, aes(fill=cv, y=Titanic, x=exdata)) + 
    geom_bar(position="dodge", stat="identity")+
    scale_fill_viridis(discrete = T)+
    ggtitle("Accuracy - Titanic") +
    theme_set(theme_bw()) +
    xlab("")+
    ylab("Accuracy")
p1 = p1 + geom_text(aes(label = Titanic), vjust = -0.2, size = 3,position = position_dodge(0.9))
  
p2 = ggplot(data2, aes(fill=cv, y=Contraceptive, x=exdata2)) + 
    geom_bar(position="dodge", stat="identity") +
    scale_fill_viridis(discrete = T) +
    ggtitle("Accuracy - Contraceptive") +
    theme_set(theme_bw()) +
    xlab("")+
    ylab("Accuracy")
p2 = p2 + geom_text(aes(label = Contraceptive), vjust = -0.2, size = 3,position = position_dodge(0.9))


# Small multiple
grid.arrange(tableGrob(Tit),tableGrob(Cont),p1, p2,ncol = 2,widths = c(1, 1),
  clip = TRUE, bottom = "Training & Validation performance of the CVs [Regularized [L1] Learner]")
#+++
#+++