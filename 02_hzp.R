## 2 Matrix multiplication
## 2.1
M1 <- matrix(sample(0:50,50),5,10)
M2 <- matrix(sample(0:50,50),10,5)
## 2.2
Matrix_muitip <- function(M1,M2){
  M3 <- matrix(0,5,5)
  for(kk in 1:5){
    for(jj in 1:5){
      for (ii in 1:10) {
        M3[kk,jj] = M1[kk,ii]*M2[ii,jj]+M3[kk,jj]
      }
    }
  }
  print(M3)
  M4 <- M1 %*% M2
  print(M4)
}
