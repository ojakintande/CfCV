#++ Real-life
#++++++Penalized L0
StudL0T = c(1.30,1.82,1.75)
InsL0T = c(0.58,1.13,1.11)
StudL0Te = c(0.95,1.96,1.61)
InsL0Te = c(0.67,1.14,1.08)

names(StudL0T) = c('CfCV','HoldOut','V-fold')
names(InsL0T) = c('CfCV','HoldOut','V-fold')
names(StudL0Te) = c('CfCV','HoldOut','V-fold')
names(InsL0Te) = c('CfCV','HoldOut','V-fold')


Stud = rbind(StudL0T,StudL0Te)
Ins = rbind(InsL0T,InsL0Te)

Student = c(1.30,1.82,1.75,0.95,1.96,1.61)
Insurance = c(0.58,1.13,1.11,0.67,1.14,1.08)
#++
exdata <- c(rep("Student Performance Training" , 3) , rep("Student Performance Validation" , 3))
exdata2 <- c(rep("Insurance Training" , 3) , rep("Insurance Validation" , 3))

cv <- rep(c("CfCV" , "HoldOut" ,"V-fold") , 2)
#cv <- c(rep("CfCV" ,3), rep("HoldOut" ,3),rep("V-fold" , 3))
data <- data.frame(exdata,cv,Student)
data2 = data.frame(exdata2,cv,Insurance)

# library
#install.packages(c('ggplot2','viridis','hrbrthemes','gridExtra'))
library(ggplot2)
library(viridis)
library(hrbrthemes)
library(gridExtra)

# Grouped
p1 = ggplot(data, aes(fill=cv, y=Student, x=exdata)) + 
    geom_bar(position="dodge", stat="identity")+
    scale_fill_viridis(discrete = T)+
    ggtitle("RMSE - Student Performance") +
    theme_set(theme_bw()) +
    xlab("")+
    ylab("RMSE")
p1 = p1 + geom_text(aes(label = Student), vjust = -0.2, size = 3,position = position_dodge(0.9))
  
p2 = ggplot(data2, aes(fill=cv, y=Insurance, x=exdata2)) + 
    geom_bar(position="dodge", stat="identity") +
    scale_fill_viridis(discrete = T) +
    ggtitle("RMSE - Insurance") +
    theme_set(theme_bw()) +
    xlab("")+
    ylab("RMSE")
p2 = p2 + geom_text(aes(label = Insurance), vjust = -0.2, size = 3,position = position_dodge(0.9))


# Small multiple
grid.arrange(tableGrob(Stud),tableGrob(Ins),p1, p2,ncol = 2,widths = c(1, 1),
  clip = TRUE, bottom = "Training & Validation performance of the CVs [Unregularized [L0] Learner]")
#+++