#----------------------------------------------------------------------
# ---------------- 		Data Simulation	Case 2		
#----------------------------------------------------------------------
#... Taining sizes
N = 15000
#... Defining features level
set.seed(001)
Age = rnorm(N, 30, 10)

# gender
gen = c("Male","Female") # 0=F, 1=M
set.seed(002)
Gender = rbinom(N,1,0.7)

# marital status
prma = c(0.38, 0.45, 0.2, 0.02)
malev = c(1, 2, 3, 4)
# Single =1, Married = 2, Divorced = 3, widowed = 4
set.seed(003)
Marital_status = sample(malev, N, replace=T,prob = prma)
table(Marital_status)

# level of education
pred = c(0.05, 0.05, 0.70, 0.20)
edu = c(1, 2, 3, 4)
# High school = 1, Tertiary = 2, Postgraduate = 3
set.seed(004)
Education = sample(edu, N, prob = pred, replace = T)
table(Education)

#. Qualification
prqu = c(0.40, 0.45, 0.15)
qu = c(0,1,2)# 1 - Bsc, 2 - Msc, 3 - PhD
set.seed(005)
Qu = sample(qu, N, prob = prqu, replace = T)
table(Qu)

# Cadre
prc = c(0.05, 0.70, 0.25)
cadle = c(0, 1, 2)
# Entry = 0, Middle = 1, Senior = 1
set.seed(006)
Cadre = sample(cadle, N, prob = prc, replace = T)
table(Cadre)

# error
set.seed(008)
err = rnorm(N,0,1)
# income

#.. race of three
r = c(0,1,2)# 2- Native, 0- Black, 1 - Others
prace = c(0.25, 0.10, 0.65)
set.seed(009)
Race2 = sample(r, N, replace = T, prob = prace)

income = 5 + (4*Age)+ (2.6*Gender) + (0.85*Marital_status)+ (1.5*Cadre) + (10.5*Race2)+(5.7*Qu) +err

# framing

case2 = data.frame(income, Age,Gender,Cadre, Race2,Qu, Marital_status)

# Recode income to bnary
case2$income2[case2$income<150] = 0 # 'Low income'
case2$income2[case2$income>=150] = 1 #"High income"

write.csv(case2, "case2_15000.csv")
table(case2$income2)
