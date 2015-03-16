### adds up jet counts above a threshold and makes composites
# warning: mean latitude than calculated from daily means because some days have more jet counts than others
make_latlon_composite_yrly <- function(min,max, lim){ 
latlon_ECbig <- list() 
#min = '05-01' 
#max = '05-10'
limit <- which(GPCC_julaug$LPC1 >= lim)
limit2 <-which(GPCC_julaug$LPC1 <= -lim)

#limit <- which(eof1_yearly >= lim)
#limit2 <-which(eof1_yearly <= -lim)
for (y in seq(1958,2001)){
   datayr <- paste('yr',y,sep='')
   datemin <- paste(y,'-',min, sep='')
   datemax <- paste(y,'-',max,sep='')
   if(y %in% GPCC_julaug$yr[limit]){
   #if(y %in% time_yr[limit]){
      index <- which(as.Date(data_eastChbig[[datayr]]$time)>=datemin & as.Date(data_eastChbig[[datayr]]$time)<=datemax) 
      utmp <- data_eastChbig[[datayr]]$u[index] 
      #utmp_min <- mean(utmp)+sd(utmp) #get u threshold to choose on  
      utmp_min <- mean(utmp) #get u threshold to choose on  
      #utmp_min <- 0 # for consistency testing
      index <- which(as.Date(data_eastChbig[[datayr]]$time) >= datemin & as.Date(data_eastChbig[[datayr]]$time)<=datemax & data_eastChbig[[datayr]]$u > utmp_min) 
      
      latlon_ECbig$pos$lat <- append(latlon_ECbig$pos$lat,data_eastChbig[[datayr]]$lat[index]) 
      latlon_ECbig$pos$lon <- append(latlon_ECbig$pos$lon,data_eastChbig[[datayr]]$lon[index])  
      latlon_ECbig$pos$u  <- append(latlon_ECbig$pos$u,data_eastChbig[[datayr]]$u[index])
    }
   if (y %in% GPCC_julaug$yr[limit2]){
   #if (y %in% time_yr[limit2]){
      index <- which(as.Date(data_eastChbig[[datayr]]$time)>=datemin & as.Date(data_eastChbig[[datayr]]$time)<=datemax) 
      utmp <- data_eastChbig[[datayr]]$u[index] 
      #utmp_min <- mean(utmp)+sd(utmp) #get u threshold to choose on  
      utmp_min <- mean(utmp) #get u threshold to choose on  
      #utmp_min <-0
      index <- which(as.Date(data_eastChbig[[datayr]]$time)>=datemin & as.Date(data_eastChbig[[datayr]]$time)<=datemax & data_eastChbig[[datayr]]$u > utmp_min) 
      latlon_ECbig$neg$lat <- append(latlon_ECbig$neg$lat,data_eastChbig[[datayr]]$lat[index]) 
      latlon_ECbig$neg$lon <- append(latlon_ECbig$neg$lon,data_eastChbig[[datayr]]$lon[index])  
      latlon_ECbig$neg$u  <- append(latlon_ECbig$neg$u,data_eastChbig[[datayr]]$u[index])
    }
}
latlon_ECbig$neg$mean <-mean(latlon_ECbig$neg$u)  
latlon_ECbig$pos$mean <-mean(latlon_ECbig$pos$u)  

latlon_ECbig$neg$sd <-sd(latlon_ECbig$neg$u)  
latlon_ECbig$pos$sd <-sd(latlon_ECbig$pos$u)  

#latlon_ECbig$neg$lat= latlon_ECbig$neg$lat[index] 
#latlon_ECbig$neg$lon= latlon_ECbig$neg$lon[index] 
#latlon_ECbig$neg$u= latlon_ECbig$neg$u[index]

 
#latlon_ECbig$pos$lat= latlon_ECbig$pos$lat[index2] 
#latlon_ECbig$pos$lon= latlon_ECbig$pos$lon[index2] 
#latlon_ECbig$pos$u= latlon_ECbig$pos$u[index2] 
return(latlon_ECbig)
}
