library(dplyr)

NBA_f1<- read.table("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/Landrace_NumberBornAlive_f1_Filtered", header=TRUE, sep=",")

for (i in 1:10){
  temp<- NBA_f1[(646*(i-1)+1):(646*i),]  
  write.table(temp[,1], paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/NBA_f1_A", "Landrace.NBA_f1_N", i, ".csv", sep=""), quote = F, row.names = F, col.names = F, sep=",")
 
}

for (i in 1:10){
  temp<- NBA_f1[-((695*(i-1)+1):(695*i)),]  
  write.table(temp[,1], paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/NBA_f1_A", "Landrace.NBA_f1_T", i, ".csv", sep=""), quote = F, row.names = F, col.names = F, sep=",")
 
}
