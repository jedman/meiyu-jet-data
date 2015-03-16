### adds up jet counts above a threshold and make a composite
## filters yearl
# warning: mean latitude than calculated from daily means because some days have more jet counts than others
#make_latlon_composite_all <- function(min,max){ 
make_latlon_composite_all <- function(days, years){ 
latlon_all <- list() 
#min = '05-01' 
#max = '05-10'

#limit <- which(eof1_yearly >= lim)
#limit2 <-which(eof1_yearly <= -lim)
for (y in years){
   datayr <- paste('yr',y,sep='')
   #datemin <- paste(y,'-',min, sep='')
   #datemax <- paste(y,'-',max,sep='')
   #if(y %in% time_yr[limit]){
      #index <- which(as.Date(data_eastChbig[[datayr]]$time)>=datemin & as.Date(data_eastChbig[[datayr]]$time)<=datemax) 
      index <- days 
      #utmp <- data_eastChbig[[datayr]]$u[index] 
      #utmp_min <- mean(utmp)+sd(utmp) #get u threshold to choose on  
      #utmp_min <- mean(utmp) #get u threshold to choose on  
      #utmp_min <- 0 # for consistency testing
      #index <- which(as.Date(data_eastChbig[[datayr]]$time) >= datemin & as.Date(data_eastChbig[[datayr]]$time)<=datemax & data_eastChbig[[datayr]]$u > utmp_min) 
      
      latlon_all$lat <- append(latlon_all$lat,data[[datayr]]$lat[index]) 
      latlon_all$lon <- append(latlon_all$lon,data[[datayr]]$lon[index])  
      #latlon_ECbig$u  <- append(latlon_ECbig??$u,data_eastChbig[[datayr]]$u[index])
}
#latlon_ECbig$mean <-mean(latlon_ECbig$u)  

#latlon_ECbig$sd <-sd(latlon_ECbig$u)  
#utmp_min <- mean(latlon_ECbig$u)  +sd(latlon_ECbig$u) 
#index <- which(latlon_ECbig$u > utmp_min) 
#latlon_ECbig$lat <- latlon_ECbig$lat[index] 
#latlon_ECbig$lon <- latlon_ECbig$lon[index] 
#latlon_ECbig$neg$lat= latlon_ECbig$neg$lat[index] 
#latlon_ECbig$neg$lon= latlon_ECbig$neg$lon[index] 
#latlon_ECbig$neg$u= latlon_ECbig$neg$u[index]

 
#latlon_ECbig$pos$lat= latlon_ECbig$pos$lat[index2] 
#latlon_ECbig$pos$lon= latlon_ECbig$pos$lon[index2] 
#latlon_ECbig$pos$u= latlon_ECbig$pos$u[index2] 
return(latlon_all)
}
