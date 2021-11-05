library(dplyr)

ADG<- read.table("/home/varcomp/Yorkshire_Breed/Cross_Validation/ADG_A/Yorkshire_ADG_Filtered", header=TRUE, sep=",")

for (i in 1:10){
  temp<- ADG[(1449*(i-1)+1):(1449*i),]  
  write.table(temp[,1], paste("/home/varcomp/Yorkshire_Breed/Cross_Validation/ADG_A/", "Yorkshire.ADG_N", i, ".csv", sep=""), quote = F, row.names = F, col.names = F, sep=",")
 
}

for (i in 1:10){
  temp<- ADG[-((1449*(i-1)+1):(1449*i)),]  
  write.table(temp[,1], paste("/home/varcomp/Yorkshire_Breed/Cross_Validation/ADG_A/", "Yorkshire.ADG_T", i, ".csv", sep=""), quote = F, row.names = F, col.names = F, sep=",")
 
}
