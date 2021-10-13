for (i in 1:10){
  temp<- ADG[-((1564*(i-1)+1):(1564*i)),]  
  write.table(temp[,1], paste("/home/varcomp/Landrace_Breed/New_Pipeline/New_Phenotypes/Cross_Validation", "Landrace.ADG_T", i, ".csv", sep=""), quote = F, row.names = F, col.names = F, sep=",")
 
}
