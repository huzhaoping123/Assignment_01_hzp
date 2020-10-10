## 4 Add or double
library(gtools)
Least_moves <- function(x){
  xx <- vector()
  number <- 1
  if(x == 1){
    print(0)
  }
  else{
    for(i in 2:x){                 ## i 控制循环的次数,也是x0每列的数字个数
      x0 <- combinations(x,i)      ## 列出所有从x个数中组合i个的选择
      for(j in 1:choose(x,i)){     ## 共有choose(x,i)种组合，j控制行数   
        if(x0[j,1] == 1){            ## 对于x0的第j行第1列，若其为1
          for(k in 2:i){             ## 选择列数
            if (x0[j,k] != (2*x0[j,k-1]) & x0[j,k] != (x0[j,k-1]+1) ){
              x0[j,k] = 0
            }
          }                          ## 让不是+1或者翻倍的数全部变为0
          if (x0[j,i] == x){         
            xx[number] = i-1
            number = number + 1 
            break                    ## 将所有成立的步数储存在xx中
          }
        }
      }
    }
    print(min(xx))
  }
}
## 通过https://blog.csdn.net/ddd326/article/details/81842360学习了break命令

Least_moves1 <- function(x){
  i <- 0
  for (ii in 1:x) {
    if(x !=1){
      if(x%%2 == 0){
        x = x/2
        i = i+1
      }
      else{
        x = x-1
        i = i+1
      }
    }
  }
  print(i)
}