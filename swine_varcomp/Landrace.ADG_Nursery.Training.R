library(dplyr)

ADG_Nursery<- read.table("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/ADG_Nursery_A/Landrace_ADG_Nursery_Filtered", header=TRUE, sep=",")

for (i in 1:10){
  temp<- ADG_Nursery[(1563*(i-1)+1):(1563*i),]  
  write.table(temp[,1], paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/ADG_Nursery_A/", "Landrace.ADG_Nursery_N", i, ".csv", sep=""), quote = F, row.names = F, col.names = F, sep=",")
 
}

for (i in 1:10){
  temp<- ADG_Nursery[-((1563*(i-1)+1):(1563*i)),]  
  write.table(temp[,1], paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/ADG_Nursery_A/", "Landrace.ADG_Nursery_T", i, ".csv", sep=""), quote = F, row.names = F, col.names = F, sep=",")
 
}
