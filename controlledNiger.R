# Installing package to read SPSS files
install.packages(haven)
library(haven)

# Importing the raw data set
niger6 <- read_sav("./Documents/students/stats/louiselotte/ngr_r6_data_2016_eng.sav")
nrow(niger6)
ncol(niger6)
str(niger6)
head(niger6, size=10)
tail(niger6)
summary(niger6)

# Create a data frame in 1 shot with selected variables
nigerR6 <- data.frame(Response=niger6$RESPNO,
                           LivingArea=niger6$URBRUR,
                           Region=niger6$REGION,
                           Gender=niger6$THISINT,
                           Age=niger6$Q1,
                           Poverty=niger6$Q8A,
                           TrustPresident=niger6$Q52A,
                           TrustParliament=niger6$Q52B,
                           TrustElectLoc=niger6$Q52E,
                           TrustPolice=niger6$Q52H,
                           TrustArmy=niger6$Q52I,
                           TrustTradiLead=niger6$Q52K,
                           Education=niger6$Q97)

str(nigerR6)
nrow(nigerR6)
ncol(nigerR6)
head(nigerR6)
tail(nigerR6)
summary(nigerR6)

#####################
# Control Variables #
#####################

# Age 1: young (< 25), 0: old (>= 25) 
head(nigerR6$Age)
##########################################################
# eliminate "Missing", "Refused" and "Don't know" values #
##########################################################
nigerR6 <- nigerR6[!(nigerR6$Age == -1 | nigerR6$Age == 998 | nigerR6$Age == 99),] 

controlAge1 <- nigerR6$Age < 25
nigerR6$Age[controlAge1] <- 1
controlAge0 <- nigerR6$Age >= 25
nigerR6$Age[controlAge0] <- 0




# Gender 1: male, 0: female
head(nigerR6$Gender)
# eliminate missing values
nigerR6 <- nigerR6[!nigerR6$Gender == -1,] 
controlGender0 <- nigerR6$Gender == 2
nigerR6$Gender[controlGender0] <- 0

# Living Area 1: Urban, 0: Rural
head(nigerR6$LivingArea)
controlLivingArea0 <- nigerR6$LivingArea == 2
nigerR6$LivingArea[controlLivingArea0] <- 0


# Education 1: Secondary or higher, 0: else
head(nigerR6$Education)
##########################################################
# eliminate "Missing", "Refused" and "Don't know" values #
##########################################################
nigerR6 <- nigerR6[!(nigerR6$Education == -1 | nigerR6$Education == 98 | nigerR6$Education == 99),] 

controlleducation1 <- nigerR6$Education >= 5
nigerR6$Education[controlleducation1] <- 1
controlleducation0 <- nigerR6$Education < 5
nigerR6$Education[controlleducation0] <- 0

# Poverty 1: without food many times, 0: else
head(nigerR6$Poverty)
##########################################################
# eliminate "Missing", "Refused" and "Don't know" values #
##########################################################
nigerR6 <- nigerR6[!(nigerR6$Poverty == -1 | nigerR6$Poverty == 9 |nigerR6$Poverty == 98),] 

controlPoverty1 <- nigerR6$Poverty == 3 | nigerR6$Poverty == 4
nigerR6$Poverty[controlPoverty1] <- 1
controlPoverty0 <- nigerR6$Poverty != 1
nigerR6$Poverty[controlPoverty0] <- 0

# controlled data frame
controlledNigerR6 <- data.frame(Response=nigerR6$Response,
                               LivingArea=nigerR6$LivingArea,
                               Region=nigerR6$Region,
                               Gender=nigerR6$Gender,
                               Age=nigerR6$Age,
                               Poverty=nigerR6$Poverty,
                               TrustPresident=nigerR6$TrustPresident,
                               TrustParliament=nigerR6$TrustParliament,
                               TrustElectLoc=nigerR6$TrustElectLoc,
                               TrustPolice=nigerR6$TrustPolice,
                               TrustArmy=nigerR6$TrustArmy,
                               TrustTradiLead=nigerR6$TrustTradiLead,
                               Education=nigerR6$Education)

head(controlledNigerR6, n=100)

##############################################################################
##############################################################################

nigerR7 <- read_sav("./Documents/students/stats/louiselotte/ngr_r7_data.sav")
nrow(nigerR7)
nigerR7 <- data.frame(Response=nigerR7$RESPNO,
                      LivingArea=nigerR7$URBRUR,
                      Region=nigerR7$REGION,
                      Gender=nigerR7$THISINT,
                      Age=nigerR7$Q1,
                      Poverty=nigerR7$Q8A,
                      TrustPresident=nigerR7$Q43A,
                      TrustParliament=nigerR7$Q43B,
                      TrustElectLoc=nigerR7$Q43C,
                      TrustPolice=nigerR7$Q43G,
                      TrustArmy=nigerR7$Q43H,
                      TrustTradiLead=nigerR7$Q43J,
                      Education=nigerR7$Q97)

head(nigerR7)   
str(nigerR7)
#####################
# Control Variables #
#####################

# Age 1: young (< 25), 0: old (>= 25) 
head(nigerR7$Age)
##########################################################
# eliminate "Missing", "Refused" and "Don't know" values #
##########################################################
nigerR7 <- nigerR7[!(nigerR7$Age == -1 | nigerR7$Age == 998 | nigerR7$Age == 99),]

controlAge1 <- nigerR7$Age < 25
nigerR7$Age[controlAge1] <- 1
controlAge0 <- nigerR7$Age >= 25
nigerR7$Age[controlAge0] <- 0




# Gender 1: male, 0: female
nigerR7 <- nigerR7[!nigerR7$Gender == -1,] # eliminate missing values
controlGender0 <- nigerR7$Gender == 2
nigerR7$Gender[controlGender0] <- 0

# Living Area 1: Urban, 0: Rural
controlLivingArea0 <- nigerR7$LivingArea == 2
nigerR7$LivingArea[controlLivingArea0] <- 0


# Education 1: Secondary or higher, 0: else
head(nigerR7$Education)
##########################################################
# eliminate "Missing", "Refused" and "Don't know" values #
##########################################################
nigerR7 <- nigerR7[!(nigerR7$Education == -1 | nigerR7$Education == 98 | nigerR7$Education == 99),] 

controlleducation1 <- nigerR7$Education >= 5
nigerR7$Education[controlleducation1] <- 1
controlleducation0 <- nigerR7$Education < 5
nigerR7$Education[controlleducation0] <- 0

# Poverty 1: without food many times, 0: else
head(nigerR7$Poverty)
##########################################################
# eliminate "Missing", "Refused" and "Don't know" values #
##########################################################
nigerR7 <- nigerR7[!(nigerR7$Poverty == -1 | nigerR7$Poverty == 9 |nigerR7$Poverty == 98),] 

controlPoverty1 <- nigerR7$Poverty == 3 | nigerR7$Poverty == 4
nigerR7$Poverty[controlPoverty1] <- 1
controlPoverty0 <- nigerR7$Poverty != 1
nigerR7$Poverty[controlPoverty0] <- 0

# controlled data frame
controlledNigerR7 <- data.frame(Response=nigerR7$Response,
                               LivingArea=nigerR7$LivingArea,
                               Region=nigerR7$Region,
                               Gender=nigerR7$Gender,
                               Age=nigerR7$Age,
                               Poverty=nigerR7$Poverty,
                               TrustPresident=nigerR7$TrustPresident,
                               TrustParliament=nigerR7$TrustParliament,
                               TrustElectLoc=nigerR7$TrustElectLoc,
                               TrustPolice=nigerR7$TrustPolice,
                               TrustArmy=nigerR7$TrustArmy,
                               TrustTradiLead=nigerR7$TrustTradiLead,
                               Education=nigerR7$Education)

head(controlledNigerR7, n=100)

##############################################################################
##############################################################################

                      
nigerR5 <- read_sav("./Documents/students/stats/louiselotte/ngr_r5_data_july_2015.sav")

nigerR5 <- data.frame(Response=nigerR5$RESPNO,
                      LivingArea=nigerR5$URBRUR,
                      Region=nigerR5$REGION,
                      Gender=nigerR5$THISINT,
                      Age=nigerR5$Q1,
                      Poverty=nigerR5$Q8A,
                      TrustPresident=nigerR5$Q59A,
                      TrustParliament=nigerR5$Q59B,
                      TrustElectLoc=nigerR5$Q59E,
                      TrustPolice=nigerR5$Q59H,
                      TrustArmy=nigerR5$Q59I,
                      Education=nigerR5$Q97)
head(nigerR5)
nrow(nigerR5)
str(nigerR5)

#####################
# Control Variables #
#####################

# Age 1: young (< 25), 0: old (>= 25)
head(nigerR5$Age)
##########################################################
# eliminate "Missing", "Ne sait pas" values #
##########################################################
nigerR5 <- nigerR5[!(nigerR5$Age == -1 | nigerR5$Age == 999),] # eliminate missing values

controlAge1 <- nigerR5$Age < 25
nigerR5$Age[controlAge1] <- 1
controlAge0 <- nigerR5$Age >= 25
nigerR5$Age[controlAge0] <- 0



# Gender 1: male, 0: female
head(nigerR5$Gender)
nigerR5 <- nigerR5[!nigerR5$Gender == -1,] # eliminate missing values
controlGender0 <- nigerR5$Gender == 2
nigerR5$Gender[controlGender0] <- 0

# Living Area 1: Urban, 0: Rural
head(nigerR5$LivingArea)
controlLivingArea0 <- nigerR5$LivingArea == 2
nigerR5$LivingArea[controlLivingArea0] <- 0


# Education 1: Secondary or higher, 0: else
head(nigerR5$Education)
##########################################################
# eliminate "Missing", "Ne sait pas" values #
##########################################################
nigerR5 <- nigerR5[!(nigerR5$Education == -1 | nigerR5$Education == 99),] 
controlleducation1 <- nigerR5$Education >= 5
nigerR5$Education[controlleducation1] <- 1
controlleducation0 <- nigerR5$Education < 5
nigerR5$Education[controlleducation0] <- 0

# Poverty 1: without food many times, 0: else
head(nigerR5$Poverty)
##########################################################
# eliminate "Missing", "Ne sait pas" values #
##########################################################
nigerR5 <- nigerR5[!(nigerR5$Poverty == -1 | nigerR5$Poverty == 9),] 
controlPoverty1 <- nigerR5$Poverty == 3 | nigerR5$Poverty == 4
nigerR5$Poverty[controlPoverty1] <- 1
controlPoverty0 <- nigerR5$Poverty != 1
nigerR5$Poverty[controlPoverty0] <- 0

# controlled data frame
controlledNigerR5 <- data.frame(Response=nigerR5$Response,
                               LivingArea=nigerR5$LivingArea,
                               Region=nigerR5$Region,
                               Gender=nigerR5$Gender,
                               Age=nigerR5$Age,
                               Poverty=nigerR5$Poverty,
                               TrustPresident=nigerR5$TrustPresident,
                               TrustParliament=nigerR5$TrustParliament,
                               TrustElectLoc=nigerR5$TrustElectLoc,
                               TrustPolice=nigerR5$TrustPolice,
                               TrustArmy=nigerR5$TrustArmy,
                               Education=nigerR5$Education)

head(controlledNigerR5, n=100)

##############################################################################
##############################################################################



