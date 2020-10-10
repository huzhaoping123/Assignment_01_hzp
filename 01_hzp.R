## 1 Flowchart
Print_values <- function(a,b,c){
  if(a > b){
    if(b > c){
      print(paste(a,b,c))
    }
    else {
      if(a > c){
        print(paste(a,c,b))
      }
      else {
        print(paste(c,a,b))
      }
    }
  }
  else {
    if(b > c){
      print(paste(c,a,b))
    }
    else {
      print(paste(c,b,a))
    }
  }
}
a <- rnorm(1)
b <- rnorm(1)
c <- rnorm(1)
Print_values(a,b,c)
