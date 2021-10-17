library(dplyr)

ADG_Finisher<- read.table("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/Landrace_ADG_Filtered", header=TRUE, sep=",")

for (i in 1:10){
  temp<- ADG_Finisher[(1563*(i-1)+1):(1563*i),]  
  write.table(temp[,1], paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/ADG_Finisher_A/", "Landrace.ADG_Finisher_N", i, ".csv", sep=""), quote = F, row.names = F, col.names = F, sep=",")
 
}

for (i in 1:10){
  temp<- ADG[-((1563*(i-1)+1):(1563*i)),]  
  write.table(temp[,1], paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/ADG_Finisher_A/", "Landrace.ADG_Finisher_T", i, ".csv", sep=""), quote = F, row.names = F, col.names = F, sep=",")
 
}
