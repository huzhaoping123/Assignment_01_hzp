## 6 Visibility in Shenzhen during the past 10 years
Original_data <- read.csv("2281305.csv",T)
VIS <- Original_data$VIS            ## 导出所需要的列
Obs_time <- Original_data$DATE
VIS_data <- substr(VIS,1,6)         ## 分列，一个观测值和三个控制条件
VIS_dis <- substr(VIS,8,8)
VIS_var <- substr(VIS,10,10) 
VIS_qua <- substr(VIS,12,12)        
VIS_data1 <- as.numeric(VIS_data)   ## 改变参数类型,符合条件1、N、1的设置为false
VIS_dis[which(VIS_dis == "1")] <- 0
VIS_dis1 <- as.logical(as.numeric(VIS_dis))
VIS_var[which(VIS_var == "N")] <- 0
VIS_var1 <- as.logical(as.numeric(VIS_var)) 
VIS_qua[which(VIS_qua == "1")] <- 0
VIS_qua1 <- as.logical(as.numeric(VIS_qua))
Obs_time1 <- as.Date(Obs_time)
VIS_data1[which(VIS_data1 > 160000 | VIS_data1 < 0)] <- NA  ##将不符合条件的值设为NA
VIS_data1[which(VIS_dis1)] <- NA
VIS_data1[which(VIS_qua1)] <- NA
VIS_data1[which(VIS_var1)] <- NA
## 6.1
plot(Obs_time1,VIS_data1,xlim=c(Obs_time1[1],Obs_time1[40000]),ylim=c(0,40000),lwd=1,type="l",col="blue") ##绘图
## 由图像可知，无明显变化

## 6.2
i <- 1
VIS_data2 <-  rep(0,5000)
Obs_time2 <-  as.Date(c())
VIS_data2[1] <- VIS_data1[1]   ##给第一行赋值第一天第一个数据
Obs_time2[1] = Obs_time1[1]
for(ii in 2:111984){
  if(Obs_time1[ii] == Obs_time1[ii-1]){
    if(!is.na(VIS_data1[ii]) & VIS_data2[i] < VIS_data1[ii]){
      VIS_data2[i] = VIS_data1[ii]
      Obs_time2[i] = Obs_time1[ii]
    }
  }
  else{
    i = i+1
  }
}
Obs_time3 <- as.numeric(substr(as.character(Obs_time2),1,4))
day_num <- matrix(0,4,7)
for (jj in 1:1215) {
  Obs_time3[jj] = Obs_time3[jj] -2009
}
for (j in 1:4){
  for (jj in 1:1215) {
    if(Obs_time3[jj] == j){
      if(VIS_data2[jj] < 5000){
        day_num[j,1] = day_num[j,1]+1
      }
      else if(VIS_data2[jj] < 10000){
        day_num[j,2] = day_num[j,2]+1
      }
      else if(VIS_data2[jj] < 15000){
        day_num[j,3] = day_num[j,3]+1
      }
      else if(VIS_data2[jj] < 20000){
        day_num[j,4] = day_num[j,4]+1
      }
      else if(VIS_data2[jj] < 25000){
        day_num[j,5] = day_num[j,5]+1
      }
      else if(VIS_data2[jj] < 30000){
        day_num[j,6] = day_num[j,6]+1
      }
      else {
        day_num[j,7] = day_num[j,7]+1
      }
    }
  }
}
print(day_num)
