library(dplyr)

LoinArea<- read.table("/home/varcomp/Yorkshire_Breed/Cross_Validation/Yorkshire_LoinArea_Filtered", header=TRUE, sep=",")

for (i in 1:10){
  temp<- LoinArea[(1510*(i-1)+1):(1510*i),]  
  write.table(temp[,1], paste("/home/varcomp/Yorkshire_Breed/Cross_Validation/", "Yorkshire.LoinArea_N", i, ".csv", sep=""), quote = F, row.names = F, col.names = F, sep=",")
 
}

for (i in 1:10){
  temp<- LoinArea[-((1510*(i-1)+1):(1510*i)),]  
  write.table(temp[,1], paste("/home/varcomp/Yorkshire_Breed/Cross_Validation/", "Yorkshire.LoinArea_T", i, ".csv", sep=""), quote = F, row.names = F, col.names = F, sep=",")
 
}
