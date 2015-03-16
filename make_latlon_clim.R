#returns all jet points the given date
make_latlon_clim <- function(date){
dailyclim <- list()
      md =  format(as.Date(date),'%m-%d')
for( y in seq(1958,2001)){
      datayr <- paste('yr',y,sep='')
      index <- which(format(as.Date(data_eastChbig[[datayr]]$time), '%m-%d')== md )
      dailyclim$lat <- append(dailyclim$lat,data_eastChbig[[datayr]]$lat[index])
      dailyclim$lon <- append(dailyclim$lon,data_eastChbig[[datayr]]$lon[index])
      dailyclim$u  <- append(dailyclim$u,data_eastChbig[[datayr]]$u[index])
 } 

return(dailyclim)
}
