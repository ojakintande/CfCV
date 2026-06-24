#----------------------------------------------------------------------
# ---------------- 		Data Simulation	Case 1		
#----------------------------------------------------------------------
#... Taining sizes
N = 1000
#... Defining features level
# age
#Age = c("18 but <25","25 but <40", "40 but <60", "<=60")
#prAge = c(0.1, 0.45, 0.30, 0.02)
Age = 18:60
set.seed(3940)
Age = sample(Age,N,replace = T)
table(Age)

# gender
gen = c("Male","Female")
set.seed(3940)
Gender = sample(gen, N, replace =T, prob = c(0.72, 0.28))
table(Gender)

# marital status
prma = c(0.45, 0.2, 0.02, 0.38)
malev = c("Married", "Divorced", "Widowed", "Single")
set.seed(3940)
Marital_status = sample(malev, N, replace=T,prob = prma)
table(Marital_status)

#..experience
y = 1:10
set.seed(3940)
Year = sample(y, N, replace =T)
table(Year)

# level of education
pred = c(0.05, 0.70, 0.25)
edu = c("High school", "Tertiary", "Postgraduate")
set.seed(3940)
Education = sample(edu, N, prob = pred, replace = T)
table(Education)

# Cadre
prc = c(0.05, 0.70, 0.25)
cadle = c("Entry", "Middle", "Senior")
set.seed(3940)
Cadre = sample(cadle, N, prob = prc, replace = T)
table(Cadre)

# race
rale = c("Native", "Black", "Non-Black Foreigner")
prr = c(0.65, 0.25, 0.1)
set.seed(3940)
Race = sample(rale, N, prob = prr, replace = T)
table(race)

# school
scl = c("High ranked", "Low ranked")
prs = c(0.65, 0.35)
set.seed(3940)
School = sample(scl, N, replace = T, prob = prs)
table(School)

# income
inc = 5000:3000
#princ = c(0.25, 0.65, 0.10)
set.seed(3940)
income = sample(inc, N, replace = T)
summary(income)

# framing

case1 = data.frame(income, Age,Cadre, Race, School, Year, Education, Marital_status)
head(case1)

#----------------------------------------------------------------------
# ---------------- 		Data Simulation	Case 2		
#----------------------------------------------------------------------




#----------------------------------------------------------------------
# ---------------- 		CfCV data splitting process		
#----------------------------------------------------------------------
mydata <- case1
glimpse(mydata)
#----------------------------------------------------------------------
# ---------------- 		Forming Grids -> CfCV & DBSCV		
#----------------------------------------------------------------------

Grid1<-mydata[mydata$Race=="Native",]
Grid2<-mydata[mydata$Race=="Black",]
Grid3<-mydata[mydata$Race=="Non-Black Foreigner",]

#----------------------------------------------------------------------
# ----------------  Backing Train CfCV -> Training & Test scheme
#----------------------------------------------------------------------
trainC_1 = Grid3
testC_1 = rbind(Grid1, Grid2)

trainC_2 = Grid2
testC_2 = rbind(Grid1, Grid3)

trainC_3 = Grid1
testC_3 = rbind(Grid2, Grid3)

#----------------------------------------------------------------------
# --------------- Fronting-Train -> DBSCV-kfold Training & Test scheme
#----------------------------------------------------------------------
trainD_1 = rbind(Grid1, Grid2)
testD_1 = Grid3

trainD_2 = rbind(Grid1, Grid3)
testD_2 = Grid2

trainD_3 = rbind(Grid2, Grid3)
testD_3 = Grid1

#----------------------------------------------------------------------
# ---------------- 	Hold-Out process -> CfCV		
#----------------------------------------------------------------------
# Seedling
set.seed(3940) 
Grid1index = sample(1:nrow(Grid1), 0.7*nrow(Grid1)) 
Grid1train = Grid1[Grid1index,] # Create the training data 
Grid1test = Grid1[-Grid1index,] # Create the test data
dim(Grid1train)
dim(Grid1test)

set.seed(3940) 
Grid2index = sample(1:nrow(Grid2), 0.7*nrow(Grid2)) 
Grid2train = Grid2[Grid2index,] # Create the training data 
Grid2test = Grid2[-Grid2index,] # Create the test data
dim(Grid2train)
dim(Grid2test)

set.seed(3940) 
Grid3index = sample(1:nrow(Grid3), 0.7*nrow(Grid3)) 
Grid3train = Grid3[Grid3index,] # Create the training data 
Grid3test = Grid3[-Grid3index,] # Create the test data
dim(Grid3train)
dim(Grid3test)

# Train
GridHoldTrain = rbind(Grid1train,Grid2train,Grid3train)
head(GridHoldTrain)
tail(GridHoldTrain)

# Test
GridHoldTest = rbind(Grid1test,Grid2test,Grid3test)
head(GridHoldTest)
tail(GridHoldTest)
GridHoldTest[200:206,] # middle

GridHoldTrain
GridHoldTest

#----------------------------------------------------------------------
# ---------------- Classical scheme -> Train All, Test All		
#----------------------------------------------------------------------
train = mydata
test = mydata
#glimpse(train)

#----------------------------------------------------------------------
# ---------------- 		k-fold -> CfCV		
#----------------------------------------------------------------------
set.seed(3940) 
index = sample(1:nrow(mydata), 0.2*nrow(mydata)) 
fold_1 = mydata[index,] 

ind = mydata[-index,] # remove the first fold
index2 = sample(1:nrow(ind), 0.25*nrow(ind)) 
fold_2 = ind[index2,]

ind2 = ind[-index2,] # remove the second fold
index3 = sample(1:nrow(ind2), 0.334*nrow(ind2)) 
fold_3 = ind2[index3,]

ind3 = ind2[-index3,] # remove the third fold
index4 = sample(1:nrow(ind3), 0.5*nrow(ind3)) 
fold_4 = ind3[index4,]

ind4 = ind3[-index4,] # remove the fourth fold
index5 = sample(1:nrow(ind4), replace = F) 
fold_5 = ind4[index5,]
#str(fold_5)

#----------------------------------------------------------------------
# ---------------- 	k-fold -> Training & Test scheme		
#----------------------------------------------------------------------
train_1 = rbind(fold_1,fold_2,fold_3,fold_4)
test_1 = fold_5

train_2 = rbind(fold_1,fold_2,fold_3,fold_5)
test_2 = fold_4

train_3 = rbind(fold_1,fold_2,fold_4,fold_5)
test_3 = fold_3

train_4 = rbind(fold_1,fold_3,fold_4,fold_5)
test_4 = fold_2

train_5 = rbind(fold_2,fold_3,fold_4,fold_5)
test_5 = fold_1

#----------------------------------------------------------------------
# --------------- DBSCV Training & Test scheme
#----------------------------------------------------------------------
trainD_1 = rbind(Grid1, Grid2)
testD_1 = Grid3

trainD_2 = rbind(Grid1, Grid3)
testD_2 = Grid2

trainD_3 = rbind(Grid2, Grid3)
testD_3 = Grid1

#----------------------------------------------------------------------
# ---------------- 		CfCV data modelling process		
#----------------------------------------------------------------------
#-----------------			Packages
#----------------------------------------------------------------------
library(plyr)
library(readr)
library(dplyr)
library(caret)
library(ggplot2)
library(repr)
#----------------------------------------------------------------------
# ---------------- 		Scaling the Numeric Features		
#----------------------------------------------------------------------
glimpse(mydata)
cols = c('Age', 'Year')

pre_proc_val <- preProcess(trainC_1[,cols], method = c("center", "scale"))

trainC_1[,cols] = predict(pre_proc_val, trainC_1[,cols])
testC_1[,cols] = predict(pre_proc_val, testC_1[,cols])

summary(trainC_1)
str(trainC_1)
#----------------------------------------------------------------------
# ---------------- 		OLS Experiment		
#----------------------------------------------------------------------
modelR = lm(income ~Age+Year, data = trainC_1)
summary(modelR)

#----------------------------------------------------------------------
# ---------------- 		Evaluation metrics		
#----------------------------------------------------------------------
#------		Step 1 - create the evaluation metrics function

eval_metrics = function(model, df, predictions, target){
    resids = df[,target] - predictions
    resids2 = resids**2
    N = length(predictions)
    r2 = as.character(round(summary(model)$r.squared, 2))
    adj_r2 = as.character(round(summary(model)$adj.r.squared, 2))
    print(adj_r2) #Adjusted R-squared
    print(as.character(round(sqrt(sum(resids2)/N), 2))) #RMSE
}

#-----	Step 2 - predicting and evaluating the model on train data

predictions = predict(modelR, newdata = trainC_1)
eval_metrics(modelR, trainC_1, predictions, target = 'income')

#-----	Step 3 - predicting and evaluating the model on test data

predictions = predict(modelR, newdata = testC_1)
eval_metrics(modelR, testC_1, predictions, target = 'income')

#----------------------------------------------------------------------
# ---------------- 		Regularizations		
#----------------------------------------------------------------------

cols_reg = c('Age', 'Cadre', 'Race', 'School', 'Year', 'Education','Marital_status', 'income')

dummies <- dummyVars(income ~ ., data = mydata[,cols_reg])

train_dummies = predict(dummies, newdata = trainC_1[,cols_reg])

test_dummies = predict(dummies, newdata = testC_1[,cols_reg])

print(dim(train_dummies)); print(dim(test_dummies))

#----------------------------------------------------------------------
# ---------------- 		Ridge regression		
#----------------------------------------------------------------------
library(glmnet)

x = as.matrix(train_dummies)
y_train = trainC_1$income

x_test = as.matrix(test_dummies)
y_test = test$income

lambdas <- 10^seq(2, -3, by = -.1)
ridge_reg = glmnet(x, y_train, nlambda = 25, alpha = 0, family = 'gaussian', lambda = lambdas)

summary(ridge_reg)

#----------------------------------------------------------------------
# ---------------- 		Ridge test- optimal lambda		
#----------------------------------------------------------------------

cv_ridge <- cv.glmnet(x, y_train, alpha = 0, lambda = lambdas)
optimal_lambda <- cv_ridge$lambda.min
optimal_lambda


# Compute R^2 from true and predicted values
eval_results <- function(true, predicted, df) {
  SSE <- sum((predicted - true)^2)
  SST <- sum((true - mean(true))^2)
  R_square <- 1 - SSE / SST
  RMSE = sqrt(SSE/nrow(df))

  
  # Model performance metrics
data.frame(
  RMSE = RMSE,
  Rsquare = R_square
)
  
}

# Prediction and evaluation on train data
predictions_train <- predict(ridge_reg, s = optimal_lambda, newx = x)
eval_results(y_train, predictions_train, trainC_1)

# Prediction and evaluation on test data
predictions_test <- predict(ridge_reg, s = optimal_lambda, newx = x_test)
eval_results(y_test, predictions_test, testC_1)

# LASSO

lambdas <- 10^seq(2, -3, by = -.1)

# Setting alpha = 1 implements lasso regression
lasso_reg <- cv.glmnet(x, y_train, alpha = 1, lambda = lambdas, standardize = TRUE, nfolds = 5)

# Best 
lambda_best <- lasso_reg$lambda.min 
lambda_best

# Modelling LASSO

lasso_model <- glmnet(x, y_train, alpha = 1, lambda = lambda_best, standardize = TRUE)

predictions_train <- predict(lasso_model, s = lambda_best, newx = x)
eval_results(y_train, predictions_train, train)


predictions_test <- predict(lasso_model, s = lambda_best, newx = x_test)
eval_results(y_test, predictions_test, test)


# Optional Elastic Regression

# Set training control
train_cont <- trainControl(method = "repeatedcv",
                              number = 10,
                              repeats = 5,
                              search = "random",
                              verboseIter = TRUE)

# Train the model
elastic_reg <- train(unemploy ~ .,
                           data = train,
                           method = "glmnet",
                           preProcess = c("center", "scale"),
                           tuneLength = 10,
                           trControl = train_cont)


# Best tuning parameter
elastic_reg$bestTune

# Elastic Test

# Make predictions on training set
predictions_train <- predict(elastic_reg, x)
eval_results(y_train, predictions_train, train) 

# Make predictions on test set
predictions_test <- predict(elastic_reg, x_test)
eval_results(y_test, predictions_test, test)

