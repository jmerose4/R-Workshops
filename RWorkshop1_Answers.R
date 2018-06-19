### R Workshop 1: Answers to Practice Exercises ###

# 1)
# Assign '0' as heads and '1' as tails and use the sample function:
Tosses = sample(0:1, 50, replace = TRUE)

# 1.1)
Stems = runif(min = 3.4, max = 11.6, n= 20) 

# 2.1)
Samples = rnorm(100, mean = 0, sd = 1)

# 2.2) 
Indices = rep(1:10, times = 6)

# 2.2.1)
Indices2 = rep(1:10, each = 6)
  
# 2.3)
Empty = matrix(0, nrow = 3, ncol = 5)

# 2.4)
Simulated = c(35,8,1,9,12)
Empty[1,] = Simulated

# 3) 
Anopheles = read.csv("~/Downloads/Anopheles_Data.csv",  header = TRUE)

# 3.1)
AvgMos = mean(Anopheles$value)
AvgMos

# 3.2)
MaxMos = max(Anopheles$value)
MaxMos

# Challenge
which(Anopheles$value == max(Anopheles$value))
# OR:
which(Anopheles$value == "1519")

# 3.2.1)
Locations = Anopheles$sample_location_info
unique(Locations) # 55 unique locations

# 3.3)
NorthF = Anopheles[Anopheles$sample_lat_DD >= 27.45672,]
SouthF = Anopheles[Anopheles$sample_lat_DD < 27.45672,]

# 3.3.1)
mean(NorthF$value) # Result = 13.03
mean(SouthF$value) # Result = 17.62

# Challenge
t.test(NorthF$value, SouthF$value) 
# Diff significant at alpha = 0.05

# 3.4) 
MonthlyMos = aggregate(Anopheles$value ~ Anopheles$sample_month, FUN = mean)
# Looks like Jan and March had highest values
# January and February only have one data point 
# January looks like it may have been a type

# 4)
Bacteria = read.table("~/Downloads/bacteria_data.txt", header= TRUE)
summary(Bacteria)

# 4.1)
# 124 patients in active treatment group
# 96 in placebo group

# 4.2) 
unique(Bacteria$ID)
# 50 "Levels" where a level is a unique patient

# 4.3)
placebo = Bacteria[Bacteria$ap == "p",]
active = Bacteria[Bacteria$ap == "a",]

# 4.4)
summary(placebo)
summary(active)
# 84/96 (87.5%) positive for H. influenzae after placebo treatment
# 96/127 (75.6%) positive after active treatment

# 5) 
Animals = read.csv("~/Downloads/CA_Animals.csv", header = TRUE)

# 5.1)
Totals = colSums(Animals) # Lizards are most abundant

# 5.2)
SiteE = Animals[5,]
sum(SiteE)
# OR:
sum(Animals[5,])

# 5.3)
Chipmunks = c(2, 4, 2, 0, 5, 1)

# 5.4) 
Animals = cbind(Animals,Chipmunks)
# 5.4.1)
#Animals = cbind(Chipmunks, Animals) would have added Chipmunks as first column rather than the last

# 5.5)
SiteG = c(3,5,4,8,0,1,2,1)
Animals = rbind(Animals, SiteG)

# 5.5.1)
# We didn't assign a name for this row so R assigned it to be "7" (since it's the 7th row)

# 5.5.2)
rownames(Animals)

#5.5.3)
rownames(Animals)[7] = "SiteG"

# 5.4) 
colnames(Animals)[3] = "CaliforniaMouse"

# 5.5)
SmallMammals = Animals[,-4]

# 5.6)
NoFire = Animals[-c(2,3),]

# 5.7) 
dim(NoFire)

# 5.8)
Mouse = NoFire$DeerMouse + NoFire$CaliforniaMouse

# 5.8.1)
Mouse = NoFire[,2] + NoFire[,3]

# 5.9) 
SmallMammals2 = NoFire[,-c(2,3)]
SmallMammals2 = cbind(Mouse, SmallMammals2)

# 5.9.1)
head(SmallMammals2)

# 5.10)
MouseRange = range(SmallMammals2$Mouse)
VolesRange = range(SmallMammals2$Voles)
MouseRange
VolesRange
# Greater variability in mice than in voles

# 5.11)
SqSm = sqrt(SmallMammals2)

