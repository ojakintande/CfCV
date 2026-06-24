#... Taining sizes
N = 1000
#... Defining features level
# age
#Age = c("18 but <25","25 but <40", "40 but <60", "<=60")
#prAge = c(0.1, 0.45, 0.30, 0.02)
Age = 18: 60
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

D = data.frame(income, Age,Cadre, Race, School, Year, Education, Marital_status)
head(D)

write.csv(D, "case1.csv")

################################################################################
# 						PART II							
################################################################################

