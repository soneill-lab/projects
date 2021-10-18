library(dplyr)
library(data.table)

add<- fread("Landrace.add.grm.txt")

Acc<- data.frame(matrix(NA, nrow = 10, ncol = 1))

for (i in 1:10) {
 AvgBW_temp<- read.table(paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/Average_Birthweight_A/yd.Landrace.AvgBW_add.CV", i, ".variance.components.model.csv", sep=""), header = T, sep=",")
 AvgBW_temp_N<- read.table(paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/Average_Birthweight_A/Landrace.AvgBW_N", i, ".csv", sep=""), header = F)
  
  AvgBW_temp<- AvgBW_temp[order(AvgBW_temp$EGO),]
  AvgBW_temp_N<- AvgBW_temp_N[order(AvgBW_temp_N$V1),]
  
  # Additive effect
  add_temp_T<- add[add$V1 %in% AvgBW_temp$EGO]
  add_temp_T<- add_temp_T[order(add_temp_T$V1),]
  add_temp_T2<- select_if(add_temp_T, colnames(add_temp_T) %in% AvgBW_temp$EGO)
  add_temp_T2<- add_temp_T2 %>% select(sort(names(add_temp_T2)))
  A_txt<- as.matrix(add_temp_T2)
  
  add_temp_N<- add[add$V1 %in% AvgBW_temp_N]
  add_temp_N<- add_temp_N[order(add_temp_N$V1),]
  add_temp_N2<- select_if(add_temp_N, colnames(add_temp_N) %in% AvgBW_temp$EGO)
  add_temp_N2<- add_temp_N2 %>% select(sort(names(add_temp_N2)))
  A_nxt<- as.matrix(add_temp_N2)
  
  
  a_t<- as.vector(AvgBW_temp$yd_A)
  diag(A_txt) = diag(A_txt) + 1e-6
  a<- A_nxt %*% solve(A_txt, a_t)
  
 write.table(a, file=paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/Average_Birthweight_A/AvgBW","_a.csv", sep=""), quote = F, col.names = F, row.names = F)
  
  p<- a 
  p<- cbind(add_temp_N$V1, p)
  p<- as.data.frame(p)
  names(p)<- c("ID","PEBV")
  
 write.table(p, file=paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/Average_Birthweight_A/AvgBW",i,"_p.csv", sep=""), quote = F, col.names = F, row.names = F)
  
  # get phenotype
  y<- read.table("Landrace_AverageBirthweight_Filtered", header = T, sep = ",")
  names(y)<- c("ID", "yd")
 AvgBW_temp_N<- as.data.frame(AvgBW_temp_N)
  names(AvgBW_temp_N)<- "ID"
  y_temp<- merge(AvgBW_temp_N, y, by="ID")
  
  # adjust by F
  AvgBW_Adj<- read.table("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/Average_Birthweight_A/yd.Landrace.AvgBW_add.CV.Adj.variance.components.model.csv", header = T, sep=",")
  AvgBW_Adj<- as.data.frame(AvgBW_Adj)
  AvgBW_Adj<- AvgBW_Adj[,c("EGO","F_FIT","yd_S")]
  names(AvgBW_Adj)[1]<- "ID"
  y_temp<- merge(y_temp,AvgBW_Adj, by="ID")
  y_temp$AvgBW_Adj<- y_temp$yd - y_temp$F_FIT - y_temp$yd_S
  
  y_temp<- merge(y_temp, p, by="ID")
  write.table(y_temp, file=paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/Average_Birthweight_A/AvgBW",i,"_y.csv", sep=""), quote = F, col.names = F, row.names = F, sep=",")
  
  
  corr<- cor(y_temp$PEBV, y_temp$AvgBW_Adj, use="p")
  print(corr)
  
  Acc[i,1]<- corr
  
}

write.table(Acc, file="/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/Average_Birthweight_A/AvgBW_Acc.csv", quote = F, col.names = F, row.names = F, sep=",")
