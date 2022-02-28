install.packages("Metrics")
library(Metrics)

trt = c("ADG","ADG_Finisher", "ADG_Nursery", "Average_Birthweight", "Average_Birthweight_f1", "Average_WW", "Average_WW_f1", "Backfat", "Birthweight", "LoinArea", "Losses", "Losses_f1", "NBA", "NBA_f1", "NumberWeaned", "NumberWeaned_f1", "TNB", "TNB_f1", "TotalTeatCount_females", "TotalTeatCount_males")

result <- matrix(NA, 10*length(trt), 5)
for (t in 1:length(trt)) {
for (i in 1:10){
# full model
ADG_temp<- read.table(paste("/home/varcomp/Yorkshire_Cross_Validation/",trt[t], "_F/", trt[t],i,"_y.csv", sep=""), header = F, sep=",")
temp_cor1 <- rmse(ADG_temp[,6], ADG_temp[,5])
temp_cor2 <- rmse(ADG_temp[,7], ADG_temp[,5])
result[i+10*(t-1),1] <- temp_cor1
result[i+10*(t-1),2] <- temp_cor2

# additive model
ADG_temp<- read.table(paste("/home/varcomp/Yorkshire_Cross_Validation/",trt[t], "_A/", trt[t],i,"_y.csv", sep=""), header = F, sep=",")
temp_cor1 <- rmse(ADG_temp[,6], ADG_temp[,5])
result[i+10*(t-1),3] <- temp_cor1
  
result[i+10*(t-1),4] <- trt[t]
result[i+10*(t-1),5] <- i

}  
}
write.csv(result, file="test1.csv", row.names=FALSE, quote=F)
