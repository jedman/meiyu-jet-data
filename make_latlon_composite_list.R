### adds up jet counts from dates in a list and makes composites
make_latlon_composite_list <- function(dates){ 
latlon_ECbig <- list() 
#compute mean month and day in the list
print(mean(as.Date(format(as.Date(dates),'%m-%d'),'%m-%d')))
#limit <- which(eof1_yearly >= lim)
#limit2 <-which(eof1_yearly <= -lim)
for (i in seq(length(dates))){ 
    y =  format(as.Date(dates[i]),'%Y')
      datayr <- paste('yr',y,sep='') 
      index <- which(as.Date(data_eastChbig[[datayr]]$time)==dates[i]) 
       # could specify a range of days by adding an integer to the date
      utmp <- data_eastChbig[[datayr]]$u[index] 
      utmp_min <- mean(utmp)+sd(utmp) #get u threshold to choose on  
      #utmp_min <- mean(utmp) #get u threshold to choose on  
      #utmp_min <- 0 # for consistency testing
#      index <- which(as.Date(data_eastChbig[[datayr]]$time) == dates[i]  & data_eastChbig[[datayr]]$u > utmp_min) 
      
      latlon_ECbig$lat <- append(latlon_ECbig$lat,data_eastChbig[[datayr]]$lat[index]) 
      latlon_ECbig$lon <- append(latlon_ECbig$lon,data_eastChbig[[datayr]]$lon[index])  
      latlon_ECbig$u  <- append(latlon_ECbig$u,data_eastChbig[[datayr]]$u[index])
}
latlon_ECbig$mean <-mean(latlon_ECbig$u)  

latlon_ECbig$sd <-sd(latlon_ECbig$u)  

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
return(latlon_ECbig)
}
