## 5 Dynamic programming
## 5.1
Find_expression <- function(x){
library(gtools)
Insert <- c("+","-"," ")
Value_all <- permutations(3,8,Insert,repeats.allowed=TRUE)
Value_all1 <- rep(1,6561)
Value_all2 <- c()
j = 1
  # make an explain how you get the number of 6561
for (ii in 1:6561) {
  for (jj in 1:8) {
    if(Value_all[ii,jj] != " "){
    Value_all1[j] = paste0(Value_all1[j],Value_all[ii,jj],jj+1)
    }
    else{
    Value_all1[j] = paste0(Value_all1[j],jj+1)
    }
  }
  j = j+1  
}
for (k in 1:6561) {
  Value_all2[k] = eval(parse(text=Value_all1[k]))
}
for (kk in 1:6561) {
  if(Value_all2[kk] == x){
    print(Value_all1[kk])
  }
}
}
## 5.2
Value_all3 <- rep(0,100)
for (l in 1:100){
  for(ll in 1:6561){
    if(Value_all2[ll] == l){
      Value_all3[l] = Value_all3[l] + 1
    }
  }
}
plot(1:100,Value_all3,lwd=1,type="l",col="blue")
which.max(Value_all3)
which.min(Value_all3)


## 从助教丁傲及同学王超处学习了命令“eval(parse(text=))”
