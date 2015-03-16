### adds up jet counts from dates in a list and makes composites
#library(fields) 
#loc is a list with x and y components defining interpolation grid
make_latlon_list_clim <- function(dates,loc){ 
require(fields) 
require(KernSmooth) 
latlon_ECbig <- list() 
kest_anom <- mat.or.vec(length(loc$x), length(loc$y)) 
k_m <-list() 
k_z <- list()  
tmp <- mat.or.vec(length(loc$x), length(loc$y))
tmp2 <- mat.or.vec(length(loc$x), length(loc$y))
#compute mean month and day in the list
print(mean(as.Date(format(as.Date(dates),'%m-%d'),'%m-%d')))
#limit <- which(eof1_yearly >= lim)
#limit2 <-which(eof1_yearly <= -lim)
#      loc$x <- seq(90, 130, by=0.5) 
#      loc$y <- seq(30,58, by=0.5) 
for (i in seq(length(dates))){ 
k_m <-list() 
k_c <- list()  
    y =  format(as.Date(dates[i]),'%Y')
      datayr <- paste('yr',y,sep='') 
      index <- which(as.Date(data_eastChbig[[datayr]]$time)==dates[i]) 
       # could specify a range of days by adding an integer to the date
      utmp <- data_eastChbig[[datayr]]$u[index] 
      utmp_min <- mean(utmp)+sd(utmp) #get u threshold to choose on  
      #utmp_min <- mean(utmp) #get u threshold to choose on  
      #utmp_min <- 0 # for consistency testing
      #index <- which(as.Date(data_eastChbig[[datayr]]$time) == dates[i]  & data_eastChbig[[datayr]]$u > utmp_min) 
      
      latlon_ECbig$lat <- append(latlon_ECbig$lat,data_eastChbig[[datayr]]$lat[index]) 
      latlon_ECbig$lon <- append(latlon_ECbig$lon,data_eastChbig[[datayr]]$lon[index])  
      latlon_ECbig$u  <- append(latlon_ECbig$u,data_eastChbig[[datayr]]$u[index])
      
      kest_m <- est_kernel(latlon_ECbig)
      clim <- make_latlon_clim(dates[i]) 
      kest_c <- est_kernel(clim)
      k_m$x <-  kest_m$x1       
      k_m$y <-  kest_m$x2       
      k_m$z <-  kest_m$fhat       
      k_c$x <-  kest_c$x1       
      k_c$y <-  kest_c$x2       
      k_c$z <-  kest_c$fhat       
      
      test_c <- interp.surface.grid(k_c ,loc)
      test_m <- interp.surface.grid(k_m ,loc)
      tmp2 <-test_c$z 
      tmp <- test_m$z
      tmp2[is.na(tmp2)] <- 0 
      tmp[is.na(tmp)] <- 0 
      kest_anom <- kest_anom + (tmp  - tmp2) 
        
     
}
    

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
return(kest_anom)
}
