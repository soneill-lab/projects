library(dplyr)

Birthweight<- read.table("/home/varcomp/Yorkshire_Breed/Cross_Validation/Birthweight_A/Yorkshire_Birthweight_Filtered", header=TRUE, sep=",")

for (i in 1:10){
  temp<- Birthweight[(1752*(i-1)+1):(1752*i),]  
  write.table(temp[,1], paste("/home/varcomp/Yorkshire_Breed/Cross_Validation/Birthweight_A/", "Yorkshire.Birthweight_N", i, ".csv", sep=""), quote = F, row.names = F, col.names = F, sep=",")
 
}

for (i in 1:10){
  temp<- Birthweight[-((1752*(i-1)+1):(1752*i)),]  
  write.table(temp[,1], paste("/home/varcomp/Yorkshire_Breed/Cross_Validation/Birthweight_A/", "Yorkshire.Birthweight_T", i, ".csv", sep=""), quote = F, row.names = F, col.names = F, sep=",")
 
}
