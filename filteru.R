filteru_imp <- function(data){ 
data_filtered <- list() 
#min = '05-01' 
#max = '05-10'

for (y in seq(1958,2001)){
   datayr <- paste('yr',y,sep='')
   dateminvec <- seq(as.Date(paste(y,'-1-1', sep='')), to= as.Date(paste(y,'-12-21',sep='')), by = '10 days') 
   datemaxvec <- seq(as.Date(paste(y,'-1-10', sep='')), to= as.Date(paste(y,'-12-31',sep='')), by = '10 days') 
  for (i  in seq(1,36)){ 
    datemin <- dateminvec[i]
   datemax <- datemaxvec[i] 
   print(datemin) 
   print(datemax) 
   #if(y %in% GPCC$yr[limit]){
   index <- which(as.Date(data[[datayr]]$time)>=datemin & as.Date(data[[datayr]]$time)<=datemax) 
      utmp <- data[[datayr]]$u[index] 
      utmp_min <- mean(utmp)+sd(utmp) #get u threshold to choose on  
      utmp_min <- mean(utmp) 
      index <- which(as.Date(data[[datayr]]$time) >= datemin & as.Date(data[[datayr]]$time)<=datemax & data[[datayr]]$u >= utmp_min) 
       
      data_filtered[[datayr]]$time <- append(data_filtered[[datayr]]$time,data[[datayr]]$time[index]) 
      data_filtered[[datayr]]$lat <- append(data_filtered[[datayr]]$lat, data[[datayr]]$lat[index]) 
      data_filtered[[datayr]]$lon <- append(data_filtered[[datayr]]$lon,data[[datayr]]$lon[index])  
      data_filtered[[datayr]]$u  <- append(data_filtered[[datayr]]$u, data[[datayr]]$u[index])
  }
}

#data_filtered$neg$lat= data_filtered$neg$lat[index] 
#data_filtered$neg$lon= data_filtered$neg$lon[index] 
#data_filtered$neg$u= data_filtered$neg$u[index]

 
#data_filtered[[datayr]]$lat= data_filtered[[datayr]]$lat[index2] 
#data_filtered[[datayr]]$lon= data_filtered[[datayr]]$lon[index2] 
#data_filtered[[datayr]]$u= data_filtered[[datayr]]$u[index2] 
return(data_filtered)
}
