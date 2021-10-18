library(dplyr)
library(data.table)

add<- fread("Landrace.add.grm.txt")
foi<- fread("Landrace.AA.grm.txt")
dom<- fread("Landrace.dom.grm.txt")
ad<- fread("Landrace.AD.grm.txt")
dd<- fread("Landrace.DD.grm.txt")

Acc<- data.frame(matrix(NA, nrow = 10, ncol = 2))

for (i in 1:10) {
  AvgBw_temp<- read.table(paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/Average_Birthweight_F/yd.Landrace.AvgBW_full.CV",i,".variance.components.model.csv", sep=""), header = T, sep=",")
  AvgBw_temp_N<- read.table(paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/Average_Birthweight_F/Landrace.AvgBw_N",i,".csv", sep=""), header = F)
  
 AvgBw_temp<- AvgBw_temp[order(AvgBw_temp$EGO),]
 AvgBw_temp_N<- AvgBw_temp_N[order(AvgBw_temp_N$V1),]
  
  # Additive effect
  add_temp_T<- add[add$V1 %in% AvgBw_temp$EGO]
  add_temp_T<- add_temp_T[order(add_temp_T$V1),]
  add_temp_T2<- select_if(add_temp_T, colnames(add_temp_T) %in% AvgBw_temp$EGO)
  add_temp_T2<- add_temp_T2 %>% select(sort(names(add_temp_T2)))
  A_txt<- as.matrix(add_temp_T2)
  
  add_temp_N<- add[add$V1 %in% AvgBw_temp_N]
  add_temp_N<- add_temp_N[order(add_temp_N$V1),]
  add_temp_N2<- select_if(add_temp_N, colnames(add_temp_N) %in% AvgBw_temp$EGO)
  add_temp_N2<- add_temp_N2 %>% select(sort(names(add_temp_N2)))
  A_nxt<- as.matrix(add_temp_N2)
  
  
  a_t<- as.vector(AvgBw_temp$yd_A)
  diag(A_txt) = diag(A_txt) + 1e-6
  a<- A_nxt %*% solve(A_txt,a_t)
  
  # AA effect
  foi_temp_T<- foi[foi$V1 %in% AvgBw_temp$EGO]
  foi_temp_T<- foi_temp_T[order(foi_temp_T$V1),]
  foi_temp_T2<- select_if(foi_temp_T, colnames(foi_temp_T) %in% AvgBw_temp$EGO)
  foi_temp_T2<- foi_temp_T2 %>% select(sort(names(foi_temp_T2)))
  F_txt<- as.matrix(foi_temp_T2)
  
  foi_temp_N<- foi[foi$V1 %in% NBA_temp_N]
  foi_temp_N<- foi_temp_N[order(foi_temp_N$V1),]
  foi_temp_N2<- select_if(foi_temp_N, colnames(foi_temp_N) %in% AvgBw_temp$EGO)
  foi_temp_N2<- foi_temp_N2 %>% select(sort(names(foi_temp_N2)))
  F_nxt<- as.matrix(foi_temp_N2)
  
  
  f_t<- as.vector(AvgBw_temp$yd_AA)
  diag(F_txt) = diag(F_txt) + 1e-6
  f<- F_nxt %*% solve(F_txt, f_t)
  
  # AD effect
  ad_temp_T<- ad[ad$V1 %in% AvgBw_temp$EGO]
  ad_temp_T<- ad_temp_T[order(ad_temp_T$V1),]
  ad_temp_T2<- select_if(ad_temp_T, colnames(ad_temp_T) %in% AvgBw_temp$EGO)
  ad_temp_T2<- ad_temp_T2 %>% select(sort(names(ad_temp_T2)))
  AD_txt<- as.matrix(ad_temp_T2)
  
  ad_temp_N<- ad[ad$V1 %in% AvgBw_temp_N]
  ad_temp_N<- ad_temp_N[order(ad_temp_N$V1),]
  ad_temp_N2<- select_if(ad_temp_N, colnames(ad_temp_N) %in% AvgBw_temp$EGO)
  ad_temp_N2<- ad_temp_N2 %>% select(sort(names(ad_temp_N2)) 
  AD_nxt<- as.matrix(ad_temp_N2)
  
  
  ad_t<- as.vector(AvgBw_temp$yd_AD)
  diag(AD_txt)= diag(AD_txt) + 1e-6
  axd<- AD_nxt %*% solve(AD_txt, ad_t)
  
  # DD effect
  dd_temp_T<- dd[dd$V1 %in% AvgBw_temp$EGO]
  dd_temp_T<- dd_temp_T[order(dd_temp_T$V1),]
  dd_temp_T2<- select_if(dd_temp_T, colnames(dd_temp_T) %in% AvgBw_temp$EGO)
  dd_temp_T2<- dd_temp_T2 %>% select(sort(names(dd_temp_T2)))
  DD_txt<- as.matrix(dd_temp_T2)
  
  dd_temp_N<- dd[dd$V1 %in% AvgBw_temp_N]
  dd_temp_N<- dd_temp_N[order(dd_temp_N$V1),]
  dd_temp_N2<- select_if(dd_temp_N, colnames(dd_temp_N) %in% AvgBw_temp$EGO)
  dd_temp_N2<- dd_temp_N2 %>% select(sort(names(dd_temp_N2)))
  DD_nxt<- as.matrix(dd_temp_N2)
  
  
  dd_t<- as.vector(AvgBw_temp$yd_DD)
  diag(DD_txt)= diag(DD_txt) + 1e-6
  dxd<- DD_nxt %*% solve(DD_txt, dd_t)
  
  # Dominance effect
  dom_temp_T<- dom[dom$V1 %in% AvgBw_temp$EGO]
  dom_temp_T<- dom_temp_T[order(dom_temp_T$V1),]
  dom_temp_T2<- select_if(dom_temp_T, colnames(dom_temp_T) %in% AvgBw_temp$EGO)
  dom_temp_T2<- dom_temp_T2 %>% select(sort(names(dom_temp_T2)))
  D_txt<- as.matrix(dom_temp_T2)
  
  dom_temp_N<- dom[dom$V1 %in% AvgBw_temp_N]
  dom_temp_N<- dom_temp_N[order(dom_temp_N$V1),]
  dom_temp_N2<- select_if(dom_temp_N, colnames(dom_temp_N) %in% AvgBw_temp$EGO)
  dom_temp_N2<- dom_temp_N2 %>% select(sort(names(dom_temp_N2)))
  D_nxt<- as.matrix(dom_temp_N2)
  
  
  d_t<- as.vector(AvgBw_temp$yd_D)
  diag(D_txt)= diag(D_txt) + 1e-6
  d<- D_nxt %*% solve(D_txt, d_t)
  
  p<- a + d + f  + axd + dxd
  
  p<- cbind(add_temp_N$V1, p, a)
  p<- as.data.frame(p)
  names(p)<- c("ID","PEBV","AEBV")
  
 # write.table(p, file=paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/Average_Birthweight_F/AvgBw",i,"_p.csv", sep=""), quote = F, col.names = F, row.names = F)
  
  # get phenotype
  y<- read.table("Landrace_Average_Birthweight_Filtered", header = T, sep = ",")
  AvgBw_temp_N<- as.data.frame(AvgBw_temp_N)
  names(AvgBw_temp_N)<- "ID"
  names(y)<- c("ID", "yd")
  y_temp<- merge(AvgBw_temp_N, y, by="ID")
  
  # adjust by F
  AvgBw_Adj<- read.table("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/Average_Birthweight_F/yd.Landrace.AvgBw_full.CV.Adj.variance.components.model.csv", header = T, sep=",")
  AvgBw_Adj<- as.data.frame(AvgBw_Adj)
  AvgBw_Adj<- AvgBw_Adj[,c("EGO","F_FIT","yd_S")]
  names(AvgBw_Adj)<- c("ID","F","S")
  y_temp<- merge(y_temp, AvgBw_Adj, by="ID")
  y_temp$AvgBw_Adj<- y_temp$yd - y_temp$F -y_temp$S

  
  y_temp<- merge(y_temp, p, by="ID")
  
  # write.table(y_temp, file=paste(/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/Average_Birthweight_F/AvgBw",i,"_y.csv", sep=""), quote = F, col.names = F, row.names = F, sep=",")
  # 
  corr<- cor(y_temp$PEBV, y_temp$AvgBw_Adj, use="p")
  corr2<- cor(y_temp$AEBV, y_temp$AvgBw_Adj, use="p")
  print(corr)
  print(corr2)
  
  Acc[i,1]<- corr
  Acc[i,2]<- corr2
  
}


write.table(Acc, file="/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation/Average_Birthweight_F/AvgBw_Acc_epi.csv", quote = F, col.names = F, row.names = F, sep=",")

