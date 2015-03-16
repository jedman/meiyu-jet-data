
### this code takes the filtered data and interpolates it back to daily
dailymnECbig_filt_interpmn <- list()
for(y in 1958:2001){
        datayr<- paste("yr",y,sep="")
        year <- seq(as.Date(paste(y,'-1-1',sep='')), to= as.Date(paste(y,'-12-31',sep='')), by ='1 day')  
        blergh <- approx(dailymnECbig_filtered_mn[[datayr]]$time, dailymnECbig_filtered_mn[[datayr]]$lat, year) 
        dailymnECbig_filt_interpmn[[datayr]]$time <- year 
        dailymnECbig_filt_interpmn[[datayr]]$lat <- blergh$y       
} 
