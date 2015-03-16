# this function adds up all the jet counts in a given time window and makes composites based on some yearly selection criteria
# warning: mean latitude than calculated from daily means because some days have more jet counts than others
make_latlon_composite_cutoff <- function(data,min,max, lim){ 
latlon_ECbig <- list() 
for (y in seq(1958,2001)){
   datayr <- paste('yr',y,sep='')
   datemin <- paste(y,'-',min, sep='')
   datemax <- paste(y,'-',max,sep='')
   if(y >= lim ){
      index <- which(as.Date(data[[datayr]]$time)>=datemin & as.Date(data[[datayr]]$time)<=datemax) 
      latlon_ECbig$pos$lat <- append(latlon_ECbig$pos$lat,data[[datayr]]$lat[index]) 
      latlon_ECbig$pos$lon <- append(latlon_ECbig$pos$lon,data[[datayr]]$lon[index])  
      latlon_ECbig$pos$u  <- append(latlon_ECbig$pos$u,data[[datayr]]$u[index])
    }
   if (y <lim ){
      index <- which(as.Date(data[[datayr]]$time)>=datemin & as.Date(data[[datayr]]$time)<=datemax) 
      latlon_ECbig$neg$lat <- append(latlon_ECbig$neg$lat,data[[datayr]]$lat[index]) 
      latlon_ECbig$neg$lon <- append(latlon_ECbig$neg$lon,data[[datayr]]$lon[index])  
      latlon_ECbig$neg$u  <- append(latlon_ECbig$neg$u,data[[datayr]]$u[index])
    }
}
#index<- which(latlon_ECbig$neg$u > mean(latlon_ECbig$neg$u) + sd(latlon_ECbig$neg$u))
#index2<- which(latlon_ECbig$pos$u > mean(latlon_ECbig$pos$u) + sd(latlon_ECbig$pos$u))
latlon_ECbig$neg$mean <-mean(latlon_ECbig$neg$u)  
latlon_ECbig$pos$mean <-mean(latlon_ECbig$pos$u)  

latlon_ECbig$neg$sd <-sd(latlon_ECbig$neg$u)  

 
return(latlon_ECbig)
}
