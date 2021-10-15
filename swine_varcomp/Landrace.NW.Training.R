library(dplyr)

NW<- read.table("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/Landrace_NumberWeaned_Filtered", header=TRUE, sep=",")

for (i in 1:10){
  temp<- NW(647*(i-1)+1):(647*i),]  
  write.table(temp[,1], paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/", "Landrace.NW_N", i, ".csv", sep=""), quote = F, row.names = F, col.names = F, sep=",")
 
}

for (i in 1:10){
  temp<- NW[-((647*(i-1)+1):(647*i)),]  
  write.table(temp[,1], paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/", "Landrace.NW_T", i, ".csv", sep=""), quote = F, row.names = F, col.names = F, sep=",")
 
}
