library(dplyr)

ADG_Finisher<- read.table("/home/varcomp/Yorkshire_Breed/Cross_Validation/ADG_Finisher_A/Yorkshire_ADG_Finisher_Filtered", header=TRUE, sep=",")

for (i in 1:10){
  temp<- ADG_Finisher[(1460*(i-1)+1):(1460*i),]  
  write.table(temp[,1], paste("/home/varcomp/Yorkshire_Breed/Cross_Validation/ADG_Finisher_A/", "Yorkshire.ADG_Finisher_N", i, ".csv", sep=""), quote = F, row.names = F, col.names = F, sep=",")
 
}

for (i in 1:10){
  temp<- ADG_Finisher[-((1460*(i-1)+1):(1460*i)),]  
  write.table(temp[,1], paste("/home/varcomp/Yorkshire_Breed/Cross_Validation/ADG_Finisher_A/", "Yorkshire.ADG_Finisher_T", i, ".csv", sep=""), quote = F, row.names = F, col.names = F, sep=",")
 
}
