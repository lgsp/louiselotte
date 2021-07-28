install.packages(haven)
library(haven)

niger6 <- read_sav("./Documents/students/stats/louiselotte/ngr_r6_data_2016_eng.sav")
nrow(niger6)
ncol(niger6)
str(niger6)
head(niger6, size=10)
tail(niger6)
summary(niger6)

niger6select <- niger6
niger6select
niger6select <- niger6$RESPNO
niger6select <- as.data.frame(niger6select)
is.data.frame(niger6select)
niger6select
niger6
urbur <- niger6$URBRUR
urbur <- as.data.frame(urbur)
urbur
niger6select <- cbind(niger6select, urbur)
niger6select
is.data.frame(niger6select)
region <- niger6$REGION
region <- as.data.frame(region)
niger6select <- cbind(niger6select, region)
niger6select
is.data.frame(niger6select)

thisint <- niger6$THISINT
thisint <- as.data.frame(thisint)
niger6select <- cbind(niger6select, thisint)
niger6select
is.data.frame(niger6select)

age <- niger6$Q1
age <- as.data.frame(age)
niger6select <- cbind(niger6select, age)
niger6select
is.data.frame(niger6select)

withoutFood <- niger6$Q80A
withoutFood <- as.data.frame(withoutFood)
niger6select <- cbind(niger6select, withoutFood)
niger6select
is.data.frame(niger6select)

trustPresident <- niger6$Q52A
trustPresident <- as.data.frame(trustPresident)
niger6select <- cbind(niger6select, trustPresident)
niger6select
is.data.frame(niger6select)

trustParliament <- niger6$Q52B
trustParliament <- as.data.frame(trustParliament)
niger6select <- cbind(niger6select, trustParliament)
niger6select
is.data.frame(niger6select)

trustElectLoc <- niger6$Q52E
trustElectLoc <- as.data.frame(trustElectLoc)
niger6select <- cbind(niger6select, trustElectLoc)
niger6select
is.data.frame(niger6select)

trustPolice <- niger6$Q52H
trustPolice <- as.data.frame(trustPolice)
niger6select <- cbind(niger6select, trustPolice)
niger6select
is.data.frame(niger6select)

trustArmy <- niger6$Q52I
trustArmy <- as.data.frame(trustArmy)
niger6select <- cbind(niger6select, trustArmy)
niger6select
is.data.frame(niger6select)


trustTradiLead <- niger6$Q52K
trustTradiLead <- as.data.frame(trustTradiLead)
niger6select <- cbind(niger6select, trustTradiLead)
niger6select
is.data.frame(niger6select)

trustEducation <- niger6$Q97
trustEducation <- as.data.frame(trustEducation)
niger6select <- cbind(niger6select, trustEducation)
niger6select
is.data.frame(niger6select)

str(niger6select)
nrow(niger6select)
ncol(niger6select)
