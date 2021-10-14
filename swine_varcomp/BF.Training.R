library(dplyr)

BF<- read.table("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/Landrace_Backfat_Filtered", header=TRUE, sep=",")

for (i in 1:10){
  temp<- BF[(1620*(i-1)+1):(1620*i),]  
  write.table(temp[,1], paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/", "Landrace.BF_N", i, ".csv", sep=""), quote = F, row.names = F, col.names = F, sep=",")
 
}

for (i in 1:10){
  temp<- BF[-((1564*(i-1)+1):(1564*i)),]  
  write.table(temp[,1], paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/", "Landrace.BF_T", i, ".csv", sep=""), quote = F, row.names = F, col.names = F, sep=",")
 
}
