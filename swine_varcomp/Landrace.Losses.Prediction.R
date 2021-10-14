library(dplyr)
library(data.table)

add<- fread("Landrace.add.grm.txt")

Acc<- data.frame(matrix(NA, nrow = 10, ncol = 1))

for (i in 1:10) {
  Losses_temp<- read.table(paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/yd.Landrace.Losses_add.CV", i, ".variance.components.model.csv", sep=""), header = T, sep=",")
  Losses_temp_N<- read.table(paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/Landrace.Losses_N", i, ".csv", sep=""), header = F)
  
  Losses_temp<- Losses_temp[order(Losses_temp$EGO),]
  Losses_temp_N<- Losses_temp_N[order(Losses_temp_N$V1),]
  
  # Additive effect
  add_temp_T<- add[add$V1 %in% Losses_temp$EGO]
  add_temp_T<- add_temp_T[order(add_temp_T$V1),]
  add_temp_T2<- select_if(add_temp_T, colnames(add_temp_T) %in% Losses_temp$EGO)
  add_temp_T2<- add_temp_T2 %>% select(sort(names(add_temp_T2)))
  A_txt<- as.matrix(add_temp_T2)
  
  add_temp_N<- add[add$V1 %in% Losses_temp_N]
  add_temp_N<- add_temp_N[order(add_temp_N$V1),]
  add_temp_N2<- select_if(add_temp_N, colnames(add_temp_N) %in% Losses_temp$EGO)
  add_temp_N2<- add_temp_N2 %>% select(sort(names(add_temp_N2)))
  A_nxt<- as.matrix(add_temp_N2)
  
  
  a_t<- as.vector(Losses_temp$yd_A)
  a<- A_nxt %*% solve(A_txt) %*% a_t
  
 write.table(a, file=paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/Losses","_a.csv", sep=""), quote = F, col.names = F, row.names = F)
  
  p<- a 
  p<- cbind(add_temp_N$V1, p)
  p<- as.data.frame(p)
  names(p)<- c("ID","PEBV")
  
 write.table(p, file=paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/Losses",i,"_p.csv", sep=""), quote = F, col.names = F, row.names = F)
  
  # get phenotype
  y<- read.table("Landrace_Losses_Filtered", header = T, sep = ",")
  names(y)<- c("ID", "yd")
 Losses_temp_N<- as.data.frame(Losses_temp_N)
  names(Losses_temp_N)<- "ID"
  y_temp<- merge(Losses_temp_N, y, by="ID")
  
  # adjust by F
  Losses_Adj<- read.table("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/yd.Landrace.Losses_add.CV.Adj.variance.components.model.csv", header = T, sep=",")
  Losses_Adj<- as.data.frame(Losses_Adj)
  Losses_Adj<- Losses_Adj[,c("EGO","F_FIT","yd_S")]
  names(Losses_Adj)[1]<- "ID"
  y_temp<- merge(y_temp,Losses_Adj, by="ID")
  y_temp$Losses_Adj<- y_temp$yd - y_temp$F_FIT - y_temp$yd_S
  
  y_temp<- merge(y_temp, p, by="ID")
  write.table(y_temp, file=paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/Losses",i,"_y.csv", sep=""), quote = F, col.names = F, row.names = F, sep=",")
  
  
  corr<- cor(y_temp$PEBV, y_temp$Losses_Adj, use="p")
  print(corr)
  
  Acc[i,1]<- corr
  
}

write.table(Acc, file="/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/Losses_Acc.csv", quote = F, col.names = F, row.names = F, sep=",")
