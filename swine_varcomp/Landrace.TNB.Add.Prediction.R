library(dplyr)
library(data.table)

add<- fread("Landrace.add.grm.txt")

Acc<- data.frame(matrix(NA, nrow = 10, ncol = 1))

for (i in 1:10) {
  TNB_temp<- read.table(paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/yd.Landrace.TNB_add.CV", i, ".variance.components.model.csv", sep=""), header = T, sep=",")
  TNB_temp_N<- read.table(paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/Landrace.TNB_N", i, ".csv", sep=""), header = F)
  
  TNB_temp<- TNB_temp[order(TNB_temp$EGO),]
  TNB_temp_N<- TNb_temp_N[order(TNB_temp_N$V1),]
  
  # Additive effect
  add_temp_T<- add[add$V1 %in% TNB_temp$EGO]
  add_temp_T<- add_temp_T[order(add_temp_T$V1),]
  add_temp_T2<- select_if(add_temp_T, colnames(add_temp_T) %in% TNB_temp$EGO)
  add_temp_T2<- add_temp_T2 %>% select(sort(names(add_temp_T2)))
  A_txt<- as.matrix(add_temp_T2)
  
  add_temp_N<- add[add$V1 %in% TNB_temp_N]
  add_temp_N<- add_temp_N[order(add_temp_N$V1),]
  add_temp_N2<- select_if(add_temp_N, colnames(add_temp_N) %in% TNB_temp$EGO)
  add_temp_N2<- add_temp_N2 %>% select(sort(names(add_temp_N2)))
  A_nxt<- as.matrix(add_temp_N2)
  
  
  a_t<- as.vector(TNB_temp$yd_A)
  a<- A_nxt %*% solve(A_txt) %*% a_t
  
 write.table(a, file=paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/TNB_A/TNB","_a.csv", sep=""), quote = F, col.names = F, row.names = F)
  
  p<- a 
  p<- cbind(add_temp_N$V1, p)
  p<- as.data.frame(p)
  names(p)<- c("ID","PEBV")
  
 write.table(p, file=paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/TNB_A/TNB",i,"_p.csv", sep=""), quote = F, col.names = F, row.names = F)
  
  # get phenotype
  y<- read.table("Landrace_TotalNumberBorn_Filtered", header = T, sep = ",")
  names(y)<- c("ID", "yd")
 TNB_temp_N<- as.data.frame(TNB_temp_N)
  names(TNB_temp_N)<- "ID"
  y_temp<- merge(TNB_temp_N, y, by="ID")
  
  # adjust by F
  TNB_Adj<- read.table("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/TNB_A/yd.Landrace.TNB_add.CV.Adj.variance.components.model.csv", header = T, sep=",")
  TNB_Adj<- as.data.frame(TNB_Adj)
  TNB_Adj<- TNB_Adj[,c("EGO","F_FIT","yd_S")]
  names(TNB_Adj)[1]<- "ID"
  y_temp<- merge(y_temp, TNB_Adj, by="ID")
  y_temp$TNB_Adj<- y_temp$yd - y_temp$F_FIT - y_temp$yd_S
  
  y_temp<- merge(y_temp, p, by="ID")
  write.table(y_temp, file=paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/TNB_A/TNB",i,"_y.csv", sep=""), quote = F, col.names = F, row.names = F, sep=",")
  
  
  corr<- cor(y_temp$PEBV, y_temp$TNB_Adj, use="p")
  print(corr)
  
  Acc[i,1]<- corr
  
}

write.table(Acc, file="/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/TNB_A/TNB_Acc.csv", quote = F, col.names = F, row.names = F, sep=",")
