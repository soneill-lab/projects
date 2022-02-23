install.packages("Metrics")
library(Metrics)

result <- matrix(NA, 10, 2)
for (i in 1:10){
ADG_temp<- read.table(paste("/home/varcomp/Yorkshire_Cross_Validation/ADG_F/ADG",i,"_y.csv", sep=""), header = F, sep=",")
temp_cor1 <- rmse(ADG_temp[,6], ADG_temp[,5])
temp_cor2 <- rmse(ADG_temp[,7], ADG_temp[,5])
result[i,1] <- temp_cor1
result[i,2] <- temp_cor2
}  
write.csv(result, file="ADG_RMSE", row.names=FALSE")
