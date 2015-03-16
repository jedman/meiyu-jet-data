#aggregate jet data into daily means
#example: mean daily jet latitude
dailymnuECbig <- list()
for(y in 1958:2001){
	datayr<- paste("yr",y,sep="")
     dailymnuECbig[[datayr]] <- aggregate(u~time,data_eastChbig[[datayr]], mean)
}
#example: plot weekly mean jet position for year 1960
#plot(rollapply(dailymn$yr1960$time,7,mean),rollapply(dailymn$yr1960$lat,7,mean),type='l')
