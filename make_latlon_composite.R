# this function adds up all the jet counts in a given time window and makes composites based on some yearly selection criteria
# warning: mean latitude than calculated from daily means because some days have more jet counts than others
make_latlon_composite <- function(min,max, lim, type){ 
latlon_ECbig <- list() 
#min = '05-01' 
#max = '05-10'
if (type == 'june'){ 
limit <- which(GPCC_jun$LPC1 >= lim)
limit2 <-which(GPCC_jun$LPC1 <= -lim)
} 
else if (type == 'july'){ 
limit <- which(GPCC_julaug$LPC1 >= lim)
limit2 <-which(GPCC_julaug$LPC1 <= -lim)
} 
else{
break() 
}
#limit <- which(eof1_yearly >= lim)
#limit2 <-which(eof1_yearly <= -lim)
for (y in seq(1958,2001)){
   datayr <- paste('yr',y,sep='')
   datemin <- paste(y,'-',min, sep='')
   datemax <- paste(y,'-',max,sep='')
   if(y %in% GPCC_jun$yr[limit]){
   #if(y %in% time_yr[limit]){
      index <- which(as.Date(data_eastChbig[[datayr]]$time)>=datemin & as.Date(data_eastChbig[[datayr]]$time)<=datemax) 
      latlon_ECbig$pos$lat <- append(latlon_ECbig$pos$lat,data_eastChbig[[datayr]]$lat[index]) 
      latlon_ECbig$pos$lon <- append(latlon_ECbig$pos$lon,data_eastChbig[[datayr]]$lon[index])  
      latlon_ECbig$pos$u  <- append(latlon_ECbig$pos$u,data_eastChbig[[datayr]]$u[index])
    }
   if (y %in% GPCC_jun$yr[limit2]){
#   if (y %in% time_yr[limit2]){
      index <- which(as.Date(data_eastChbig[[datayr]]$time)>=datemin & as.Date(data_eastChbig[[datayr]]$time)<=datemax) 
      latlon_ECbig$neg$lat <- append(latlon_ECbig$neg$lat,data_eastChbig[[datayr]]$lat[index]) 
      latlon_ECbig$neg$lon <- append(latlon_ECbig$neg$lon,data_eastChbig[[datayr]]$lon[index])  
      latlon_ECbig$neg$u  <- append(latlon_ECbig$neg$u,data_eastChbig[[datayr]]$u[index])
    }
}
#index<- which(latlon_ECbig$neg$u > mean(latlon_ECbig$neg$u) + sd(latlon_ECbig$neg$u))
#index2<- which(latlon_ECbig$pos$u > mean(latlon_ECbig$pos$u) + sd(latlon_ECbig$pos$u))
index<- which(latlon_ECbig$neg$u > 0.)
index2<- which(latlon_ECbig$pos$u > 0.)
#latlon_ECbig$neg$mean <-mean(latlon_ECbig$neg$u)  
#latlon_ECbig$pos$mean <-mean(latlon_ECbig$pos$u)  

latlon_ECbig$neg$sd <-sd(latlon_ECbig$neg$u)  
latlon_ECbig$pos$sd <-sd(latlon_ECbig$pos$u)  

latlon_ECbig$neg$lat= latlon_ECbig$neg$lat[index] 
latlon_ECbig$neg$lon= latlon_ECbig$neg$lon[index] 
latlon_ECbig$neg$u= latlon_ECbig$neg$u[index]

 
latlon_ECbig$pos$lat= latlon_ECbig$pos$lat[index2] 
latlon_ECbig$pos$lon= latlon_ECbig$pos$lon[index2] 
latlon_ECbig$pos$u= latlon_ECbig$pos$u[index2] 
return(latlon_ECbig)
}
