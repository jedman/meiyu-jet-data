make_composites_filt <- function(data,min,max,lim){
win <- 7 
sdate <- 90 #june 1=152, may 15=135 
ndays <- 200
june <- seq(sdate,sdate+ndays)
y<-1958 
index <- which(GPCC_jun$LPC1 >= lim)
index2 <- which(GPCC_jun$LPC1 <= -lim)
#index <- which(eof2_yearly >= lim) # try it with Jesse's EOFs
#index2 <- which(eof2_yearly <= -lim)
datayr <- paste('yr',y,sep='')
datemin <- paste(y,'-',min,sep='') 
datemax <- paste(y,'-',max,sep='') 
tindex <- which(as.Date(data[[datayr]]$time)>=datemin & as.Date(data[[datayr]]$time)<=datemax)
samp_pos <- mat.or.vec(length(tindex),1)
samp_neg <- mat.or.vec(length(tindex),1)
#dev.new() 
#par(mfrow=c(3,2)) 
p = 0
n=0
for (y in seq(1958, 2001)) { 
datayr <- paste('yr',y,sep='')
datemin <- paste(y,'-',min,sep='') 
datemax <- paste(y,'-',max,sep='') 
tindex <- which(as.Date(data[[datayr]]$time)>=datemin & as.Date(data[[datayr]]$time)<=datemax)
if(y %in% GPCC_jun$yr[index]){  
#if(y %in% time_yr[index]){  
samp_pos <- samp_pos+data[[datayr]]$lat[tindex] 
p=p+1
}
if (y %in% GPCC_jun$yr[index2]){
#if (y %in% time_yr[index2]){
samp_neg <- samp_neg+data[[datayr]]$lat[tindex]
n=n+1
}
}
samp_pos = samp_pos/p
samp_neg = samp_neg/n
return(list(samp_pos, samp_neg)) 
}

