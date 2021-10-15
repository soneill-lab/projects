library(dplyr)

F_TeatCount<- read.table("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/Landrace_BirthTotalTeatCount_females_Filtered", header=TRUE, sep=",")

for (i in 1:10){
  temp<- F_TeatCount[(453*(i-1)+1):(453*i),]  
  write.table(temp[,1], paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/", "Landrace.F_TeatCount_N", i, ".csv", sep=""), quote = F, row.names = F, col.names = F, sep=",")
 
}

for (i in 1:10){
  temp<- F_TeatCount[-((453*(i-1)+1):(453*i)),]  
  write.table(temp[,1], paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/", "Landrace.F_TeatCount_T", i, ".csv", sep=""), quote = F, row.names = F, col.names = F, sep=",")
 
}
