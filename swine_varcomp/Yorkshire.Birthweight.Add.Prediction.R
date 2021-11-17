library(dplyr)
library(data.table)

add<- fread("yorkshire.add.grm.txt")


Acc<- data.frame(matrix(NA, nrow = 10, ncol = 1))

for (i in 1:10) {
  Birthweight_temp<- read.table(paste("/home/varcomp/Yorkshire_Breed/Cross_Validation/Birthweight_A/yd.Yorkshire.Birthweight_add.CV", i, ".variance.components.model.csv", sep=""), header = T, sep=",")
  Birthweight_temp_N<- read.table(paste("/home/varcomp/Yorkshire_Breed/Cross_Validation/Birthweight_A/Yorkshire.Birthweight_N", i, ".csv", sep=""), header = F)
  
 Birthweight_temp<- Birthweight_temp[order(Birthweight_temp$EGO),]
 Birthweight_temp_N<- Birthweight_temp_N[order(Birthweight_temp_N$V1),]
  
  # Additive effect
  add_temp_T<- add[add$V1 %in% Birthweight_temp$EGO]
  add_temp_T<- add_temp_T[order(add_temp_T$V1),]
  add_temp_T2<- select_if(add_temp_T, colnames(add_temp_T) %in% Birthweight_temp$EGO)
  add_temp_T2<- add_temp_T2 %>% select(sort(names(add_temp_T2)))
  A_txt<- as.matrix(add_temp_T2)
  
  add_temp_N<- add[add$V1 %in% Birthweight_temp_N]
  add_temp_N<- add_temp_N[order(add_temp_N$V1),]
  add_temp_N2<- select_if(add_temp_N, colnames(add_temp_N) %in% Birthweight_temp$EGO)
  add_temp_N2<- add_temp_N2 %>% select(sort(names(add_temp_N2)))
  A_nxt<- as.matrix(add_temp_N2)
  
  
  a_t<- as.vector(ADG_Finisher_temp$yd_A)
  diag(A_txt) = diag(A_txt) + 1e-6
  a<- A_nxt %*% solve(A_txt, a_t)
  
 write.table(a, file=paste("/home/varcomp/Yorkshire_Breed/Cross_Validation/Birthweight_A/Birthweight","_a.csv", sep=""), quote = F, col.names = F, row.names = F)
  
  p<- a 
  p<- cbind(add_temp_N$V1, p)
  p<- as.data.frame(p)
  names(p)<- c("ID","PEBV")
  
 write.table(p, file=paste("/home/varcomp/Yorkshire_Breed/Cross_Validation/Birthweight_A/Birthweight",i,"_p.csv", sep=""), quote = F, col.names = F, row.names = F)
  
  # get phenotype
  y<- read.table("Yorkshire_Birthweight_Filtered", header = T, sep = ",")
  names(y)<- c("ID", "yd")
 Birthweight_temp_N<- as.data.frame(Birthweight_temp_N)
  names(ADG_Finisher_temp_N)<- "ID"
  y_temp<- merge(Birthweight_temp_N, y, by="ID")
 
  # adjust by F
  ADG_Finisher_Adj<- read.table("/home/varcomp/Yorkshire_Breed/Cross_Validation/Birthweight_A/yd.Yorkshire.Birthweight_add.CV.Adj.variance.components.model.csv", header = T, sep=",")
  ADG_Finisher_Adj<- as.data.frame(ADG_Finisher_Adj)
  ADG_Finisher_Adj<- ADG_Finisher_Adj[,c("EGO","F_FIT","yd_S")]
  names(ADG_Finisher_Adj)[1]<- "ID"
  y_temp<- merge(y_temp, ADG_Finisher_Adj, by="ID")
  y_temp$ADG_Finisher_Adj<- y_temp$yd - y_temp$F_FIT - y_temp$yd_S
  
  y_temp<- merge(y_temp, p, by="ID")
  write.table(y_temp, file=paste("/home/varcomp/Yorkshire_Breed/Cross_Validation/Birthweight_A/Birthweight",i,"_y.csv", sep=""), quote = F, col.names = F, row.names = F, sep=",")
  
  
  corr<- cor(y_temp$PEBV, y_temp$Birthweight_Adj, use="p")
  print(corr)
  
  Acc[i,1]<- corr
  
}

write.table(Acc, file="/home/varcomp/Yorkshire_Breed/Cross_Validation/Birthweight_A/Birthweight_Acc.csv", quote = F, col.names = F, row.names = F, sep=",")_temp<- read.table(paste("/home/varcomp/Yorkshire_Breed/Cross_Validation/ADG_Nursery_A/yd.Yorkshire.ADG_Nursery_add.CV", i, ".variance.components.model.csv", sep=""), header = T, sep=",")
  Birthweight_temp_N<- read.table(paste("/home/varcomp/Yorkshire_Breed/Cross_Validation/Birthweight_A/Yorkshire.Birthweight_N", i, ".csv", sep=""), header = F)
  
  Birthweight_temp<- Birthweight_temp[order(Birthweight_temp$EGO),]
  Birthweight_temp_N<- Birthweight_temp_N[order(Birthweight_temp_N$V1),]
  
  # Additive effect
  add_temp_T<- add[add$V1 %in% Birthweight_temp$EGO]
  add_temp_T<- add_temp_T[order(add_temp_T$V1),]
  add_temp_T2<- select_if(add_temp_T, colnames(add_temp_T) %in% Birthweight_temp$EGO)
  add_temp_T2<- add_temp_T2 %>% select(sort(names(add_temp_T2)))
  A_txt<- as.matrix(add_temp_T2)
  
  add_temp_N<- add[add$V1 %in% Birthweight_temp_N]
  add_temp_N<- add_temp_N[order(add_temp_N$V1),]
  add_temp_N2<- select_if(add_temp_N, colnames(add_temp_N) %in% Birthweight_temp$EGO)
  add_temp_N2<- add_temp_N2 %>% select(sort(names(add_temp_N2)))
  A_nxt<- as.matrix(add_temp_N2)
  
  
  a_t<- as.vector(Birthweight_temp$yd_A)
  diag(A_txt) = diag(A_txt) + 1e-6
  a<- A_nxt %*% solve(A_txt, a_t)
  
 write.table(a, file=paste("/home/varcomp/Yorkshire_Breed/Cross_Validation/Birthweight_A/Birthweight","_a.csv", sep=""), quote = F, col.names = F, row.names = F)
  
  p<- a 
  p<- cbind(add_temp_N$V1, p)
  p<- as.data.frame(p)
  names(p)<- c("ID","PEBV")
  
 write.table(p, file=paste("/home/varcomp/Yorkshire_Breed/Cross_Validation/Birthweight_A/Birthweight",i,"_p.csv", sep=""), quote = F, col.names = F, row.names = F)
  
  # get phenotype
  y<- read.table("Yorkshire_Birthweight_Filtered", header = T, sep = ",")
  names(y)<- c("ID", "yd")
 ADG_Finisher_temp_N<- as.data.frame(ADG_Finisher_temp_N)
  names(ADG_Finisher_temp_N)<- "ID"
  y_temp<- merge(Birthweight_temp_N, y, by="ID")
 
  # adjust by F
  Birthweight_Adj<- read.table("/home/varcomp/Yorkshire_Breed/Cross_Validation/Birthweight_A/yd.Yorkshire.Birthweight_add.CV.Adj.variance.components.model.csv", header = T, sep=",")
 Birthweight_Adj<- as.data.frame(Birthweight_Adj)
  Birthweight_Adj<- Birthweight_Adj[,c("EGO","F_FIT","yd_S")]
  names(Birthweight_Adj)[1]<- "ID"
  y_temp<- merge(y_temp, Birthweight_Adj, by="ID")
  y_temp$Birthweight_Adj<- y_temp$yd - y_temp$F_FIT - y_temp$yd_S
  
  y_temp<- merge(y_temp, p, by="ID")
  write.table(y_temp, file=paste("/home/varcomp/Yorkshire_Breed/Cross_Validation/Birthweight_A/Birthweight",i,"_y.csv", sep=""), quote = F, col.names = F, row.names = F, sep=",")
  
  
  corr<- cor(y_temp$PEBV, y_temp$Birthweight_Adj, use="p")
  print(corr)
  
  Acc[i,1]<- corr
  
}

write.table(Acc, file="/home/varcomp/Yorkshire_Breed/Cross_Validation/Birthweight_A/Birthweight_Acc.csv", quote = F, col.names = F, row.names = F, sep=",")
