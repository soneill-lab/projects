library(dplyr)

ADG<- read.table("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/Landrace_ADG_Filtered", header=TRUE, sep=",")

for (i in 1:10){
  temp<- sample(ADG$IID,(1564*(i-1)+1):(1564*i), replace=FALSE)  
  write.table(temp[,1], paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/", "Landrace.ADG_N", i, ".csv", sep=""), quote = F, row.names = F, col.names = F, sep=",")
 
}

for (i in 1:10){
  -temp  
  write.table(temp[,1], paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/", "Landrace.ADG_T", i, ".csv", sep=""), quote = F, row.names = F, col.names = F, sep=",")
 
}
