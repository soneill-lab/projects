install.packages("Metrics")
library(Metrics)

trt = c("ADG",)

result <- matrix(NA, 10*length(trt), 3)
for (t in 1:length(trt)) {
for (i in 1:10){
# full model
ADG_temp<- read.table(paste("/home/varcomp/Yorkshire_Cross_Validation/",trt[t], "_F/", trt[t],i,"_y.csv", sep=""), header = F, sep=",")
temp_cor1 <- rmse(ADG_temp[,6], ADG_temp[,5])
temp_cor2 <- rmse(ADG_temp[,7], ADG_temp[,5])
result[i,1] <- temp_cor1
result[i,2] <- temp_cor2

# additive model
ADG_temp<- read.table(paste("/home/varcomp/Yorkshire_Cross_Validation/",trt[t], "_A/", trt[t],i,"_y.csv", sep=""), header = F, sep=",")
temp_cor1 <- rmse(ADG_temp[,6], ADG_temp[,5])
result[i,3] <- temp_cor1

}  
}
write.csv(result, file="test1.csv", row.names=FALSE)
