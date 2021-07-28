install.packages(haven)
library(haven)

niger6 <- read_sav("./Documents/students/stats/louiselotte/ngr_r6_data_2016_eng.sav")
nrow(niger6)
ncol(niger6)
str(niger6)
head(niger6, size=10)
tail(niger6)
summary(niger6)

# Create in 1 shot dataframe
niger6select <- data.frame(Response=niger6$RESPNO,
                           UrbRur=niger6$URBRUR,
                           Region=niger6$REGION,
                           ThisInt=niger6$THISINT,
                           Age=niger6$Q1,
                           WithoutFood=niger6$Q80A,
                           TrustPresident=niger6$Q52A,
                           TrustParliament=niger6$Q52B,
                           TrustElectLoc=niger6$Q52E,
                           TrustPolice=niger6$Q52H,
                           TrustArmy=niger6$Q52I,
                           TrustTradiLead=niger6$Q52K,
                           TrustEducation=niger6$Q97)

str(niger6select)
nrow(niger6select)
ncol(niger6select)
head(niger6select)
tail(niger6select)
summary(niger6select)
