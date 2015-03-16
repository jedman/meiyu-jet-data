#aggregate jet data into daily means
#example: mean daily jet latitude
#dailymnTP <- list()
#dailymneastCh <- list()
#dailymdTP <- list()
#dailymdECbig <- list()
dailysdECbig <- list()
dailysdlatECbig <- list()
dailysduECbig <- list()
for(y in 1958:2001){
	datayr<- paste("yr",y,sep="")
    #dailymnTP[[datayr]] <- aggregate(lat~time,data_TP[[datayr]],mean)
    #dailymneastCh[[datayr]] <- aggregate(lat~time,data_eastCh[[datayr]],mean)
    #dailymdTP[[datayr]] <- aggregate(lat~time,data_TP[[datayr]],median)
    # dailymaxECbig[[datayr]]<-  aggregate(lat~time,data_eastChbig[[datayr]], max)
    # dailymdECbig[[datayr]]<-  aggregate(lat~time,data_eastChbig[[datayr]], median)
     dailysdECbig[[datayr]]<-  aggregate(lat~time,data_eastChbig[[datayr]], sd)
     dailysdlatECbig[[datayr]] <- aggregate(lat~time,data_lat_eastChbig[[datayr]], sd)
     dailysduECbig[[datayr]] <- aggregate(lat~time,data_u_eastChbig[[datayr]], sd)
}
#example: plot weekly mean jet position for year 1960
#plot(rollapply(dailymn$yr1960$time,7,mean),rollapply(dailymn$yr1960$lat,7,mean),type='l')
