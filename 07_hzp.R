## 7 Explore a data set
## 7.1
data <- read.csv("SAC CITY.csv",T)  ## sac city的降水数据
PRCP <- data$PRCP                   
DATE <- data$DATE
PRCP <- as.numeric(PRCP)
PRCP[which(PRCP < 0)] <- NA
DATE <- as.Date(DATE)
## 7.2
plot(DATE,PRCP,lwd=1,type="l",col="blue")
## 7.3
max(PRCP,na.rm=T)     ##最大日降水量
DATE[which(PRCP == max(PRCP,na.rm=T))] ##最大日降水发生的时间
mean(PRCP,na.rm=T)    ##日降水的均值
sum(PRCP,na.rm=T)/15  ##2005-2019年平均降水
i <- 0
for (ii in 1:5455) {
  if(!is.na(PRCP[ii]) & PRCP[ii]>0){
    i= i+1
  }
}
print(i/15)           ##2005-2019平均每年有降水的天数
