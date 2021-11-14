library(dplyr)

ADG_Nursery<- read.table("/home/varcomp/Yorkshire_Breed/Cross_Validation/ADG_Nursery_A/Yorkshire_ADG_Nursery_Filtered", header=TRUE, sep=",")

for (i in 1:10){
  temp<- ADG_Nursery[(1523*(i-1)+1):(1523*i),]  
  write.table(temp[,1], paste(/"home/varcomp/Yorkshire_Breed/Cross_Validation/ADG_Nursery_A", "Yorkshire.ADG_Nursery_N", i, ".csv", sep=""), quote = F, row.names = F, col.names = F, sep=",")
 
}

for (i in 1:10){
  temp<- ADG_Nursery[-((1523*(i-1)+1):(1523*i)),]  
  write.table(temp[,1], paste("/home/varcomp/Yorkshire_Breed/Cross_Validation/ADG_Nursery_A", "Yorkshire.ADG_Nursery_T", i, ".csv", sep=""), quote = F, row.names = F, col.names = F, sep=",")
 
}
