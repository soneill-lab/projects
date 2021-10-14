library(dplyr)

Losses<- read.table("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/Landrace_Losses_Filtered", header=TRUE, sep=",")

for (i in 1:10){
  temp<- Losses[(623*(i-1)+1):(623*i),]  
  write.table(temp[,1], paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/", "Landrace.Losses_N", i, ".csv", sep=""), quote = F, row.names = F, col.names = F, sep=",")
 
}

for (i in 1:10){
  temp<- Losses[-((623*(i-1)+1):(623*i)),]  
  write.table(temp[,1], paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/", "Landrace.Losses_T", i, ".csv", sep=""), quote = F, row.names = F, col.names = F, sep=",")
 
}
