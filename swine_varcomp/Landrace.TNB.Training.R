library(dplyr)

TNB<- read.table("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/Landrace_TotalNumberBorn_Filtered", header=TRUE, sep=",")

for (i in 1:10){
  temp<- TNB[(695*(i-1)+1):(695*i),]  
  write.table(temp[,1], paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/TNB_A", "Landrace.TNB_N", i, ".csv", sep=""), quote = F, row.names = F, col.names = F, sep=",")
 
}

for (i in 1:10){
  temp<- TNB[-((695*(i-1)+1):(695*i)),]  
  write.table(temp[,1], paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/TNB_A", "Landrace.TNB_T", i, ".csv", sep=""), quote = F, row.names = F, col.names = F, sep=",")
 
}
