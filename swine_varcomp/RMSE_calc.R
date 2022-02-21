install.packages("

for (i in 1:10){
ADG_temp<- read.table(paste("/home/varcomp/Yorkshire_Cross_Validation/ADG_F/ADG",i,"_y.csv", sep=""), header = F, sep=",")
ADG_corr<-cor(ADG_temp[,5], ADG_temp[,6])
}
