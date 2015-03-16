make_composites_cutoff <- function(data){
sdate <- 90 #june 1=152, may 15=135 
ndays <- 200
june <- seq(sdate,sdate+ndays)
y<-0 
samp_pos <- mat.or.vec(length(june),1)
samp_neg <- mat.or.vec(length(june),1) 
arr_pos <- mat.or.vec(length(june),22) 
arr_neg <- mat.or.vec(length(june),22) 
#dev.new() 
#par(mfrow=c(3,2)) 
p = 0
n = 0
for (y in seq(1958, 2001)) { 
datayr <- paste('yr',y,sep='')
if(y >= 1980 ){  
#if(y %in% time_yr[index]){  
samp_pos <- samp_pos+data[[datayr]]$lat[june] 
p=p+1
arr_pos[,p] <- data[[datayr]]$lat[june]
}
if (y < 1980 ){
#if (y %in% time_yr[index2]){
samp_neg <- samp_neg+data[[datayr]]$lat[june]
n=n+1
arr_neg[,n] <- data[[datayr]]$lat[june]
}
}
samp_pos = samp_pos/p
samp_neg = samp_neg/n
sdpos <- apply(arr_pos, 1,sd) 
sdneg <- apply(arr_neg, 1,sd) 
return(list(samp_pos, samp_neg,june,sdpos, sdneg )) 
}

