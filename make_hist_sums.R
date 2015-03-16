sum_hist <- function(yr){
win <- 7 
sdate <- 135 #june 1=152, may 15=135 
ndays <- 28
datayr <- paste('yr',yr,sep='')
y<-0 
june_pentads <- mat.or.vec(4,41)
#dev.new() 
#par(mfrow=c(3,2)) 
for (d in seq(1,ndays,by=win)) { 
y<-y+1
samp <- dailyhist_TP[[datayr]][sdate+d,2][[3]] #frequencies[[3]] or counts [[2]]? Does it matter???
for (i in 2:win ){ 
samp <- samp + dailyhist_TP[[datayr]][sdate+d+i,2][[3]]
}
june_pentads[y,]<- samp/win 
#plot(dailyhist_eastCh$yr1980[1,2][[5]],june_pentads[y,],type='h',xlab='latitude')
} 
return(june_pentads) 
}
