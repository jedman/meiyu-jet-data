#find the spring jet transition date 
library(zoo)
minlat <- 41 # latitude criteria for summer transition
win <- 20 #averaging window (days)
i=1
for(y in 1958:2001){
	datayr<- paste("yr",y,sep="")
    latsm <- rollapply(dailymnTP[[datayr]]$lat,win,mean)
    tsm <- rollapply(dailymnTP[[datayr]]$time,win,mean)
    index <- which(latsm > minlat)

    indexs <-  which(latsm < minlat &  tsm < tsm[max(index)] & tsm < tsm[210]) #picks out last northward transition
    
    dailymdTP[[datayr]]$transdate <- tsm[[index[1]]]
    dailymdTP[[datayr]]$transdatefall <- tsm[max(index)]
    transdate[i] <- tsm[index[1]]
    transdatefall[i] <- tsm[max(index)]
     
    transdate2[i] <- tsm[max(indexs)]
    maxlat[i] <- max(latsm) 
     i=i+1
      
    }
    
    #plot transition time series
    transdate <- as.POSIXlt(as.Date(transdate,format="%Y/%m/%d"))
    transdatefall <- as.POSIXlt(as.Date(transdatefall,format="%Y/%m/%d"))
    transdate2 <- as.POSIXlt(as.Date(transdate2,format="%Y/%m/%d"))
#    plot(transdate$year+1900,transdate$yday,type='l', main='jet transition date', ylab='day of the year', xlab='year')
