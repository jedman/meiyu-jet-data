# ks testing
library(Matching)
jetlat_kstest <- function(data,days, win){
  early_dist <- blocked_mean(data$yr1958$lat[days],win)
  for (y in 1959:1979){
    datayr <- paste("yr",y,sep ="")
     early_dist <- c(early_dist, blocked_mean(data[[datayr]]$lat[days],win))
  }
  late_dist <- blocked_mean(data$yr1980$lat[days],win)
  for (y in 1981:2001){
    datayr <- paste("yr",y,sep ="")
    late_dist <- c(late_dist, blocked_mean(data[[datayr]]$lat[days],win))
  }
  return(ks.boot(early_dist, late_dist, nboots = 1000))
  
}

jetlat_chitest <- function(data,days){
  early_dist <- data$yr1958$lat[days]
  for (y in 1959:1979){
    datayr <- paste("yr",y,sep ="")
    early_dist <- c(early_dist, data[[datayr]]$lat[days])
  }
  late_dist <- data$yr1980$lat[days]
  for (y in 1981:2001){
    datayr <- paste("yr",y,sep ="")
    late_dist <- c(late_dist, data[[datayr]]$lat[days])
  }
  
  return(chisq.test(early_dist, late_dist, simulate.p.value = TRUE)) 
  # simulates p values using monte carlo estimation
  #return(early_dist)
}

jetlat_wilcox <- function(data,days){
  early_dist <- data$yr1958$lat[days]
  for (y in 1959:1979){
    datayr <- paste("yr",y,sep ="")
    early_dist <- c(early_dist, data[[datayr]]$lat[days])
  }
  late_dist <- data$yr1980$lat[days]
  for (y in 1981:2001){
    datayr <- paste("yr",y,sep ="")
    late_dist <- c(late_dist, data[[datayr]]$lat[days])
  }
  
  return(wilcox.test(early_dist, late_dist)) 
  # simulates p values using monte carlo estimation
  #return(early_dist)
}

blocked_mean <- function(data, window){
  tmpdata <- mean(data[1:window])
  for (i in seq(window,length(data)-window,by=window)){
    tmpdata <- c(tmpdata,mean(data[i:i+window]))        
  }
  return(tmpdata)
}

acf_mean<- function(data, days, window){
  tmp <- acf(blocked_mean(data$yr1958$lat[days],window),lag.max = 40)
  #tmp <- acf(data$yr1958$lat[days], lag.max = 15)
  acf_yearly <- tmp$acf
  for (y in 1959:2001){
    datayr <- paste("yr",y,sep ="")
    tmp <- acf(blocked_mean(data[[datayr]]$lat[days],window), plot = TRUE, lag.max = 40)
    #tmp <- acf(data[[datayr]]$lat[days], lag.max = 15)
    acf_yearly <- acf_yearly + tmp$acf
  }
  return(acf_yearly)
}

dist_lats<- function(data, days){
  tmp <-data$yr1958$lat[days]
  #tmp <- acf(data$yr1958$lat[days], lag.max = 15)
  for (y in 1959:2001){
    datayr <- paste("yr",y,sep ="")
    tmp <- c(tmp, data[[datayr]]$lat[days])
  }
  return(tmp)
}