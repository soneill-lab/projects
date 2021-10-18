library(dplyr)

AvgBW<- read.table("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/Average_Birthweight_A/Landrace_AverageBirthweight_Filtered", header=TRUE, sep=",")

for (i in 1:10){
  temp<- AvgBW[(1563*(i-1)+1):(1563*i),]  
  write.table(temp[,1], paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/Average_Birthweight_A/", "Landrace.AvgBW_N", i, ".csv", sep=""), quote = F, row.names = F, col.names = F, sep=",")
 
}

for (i in 1:10){
  temp<- AvgBW[-((1563*(i-1)+1):(1563*i)),]  
  write.table(temp[,1], paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/Average_Birthweight_A/", "Landrace.AvgBW_T", i, ".csv", sep=""), quote = F, row.names = F, col.names = F, sep=",")
 
}
