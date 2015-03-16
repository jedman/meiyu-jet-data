dailyhist_TP <- list()
for(y in 1958:2001){
datayr<- paste("yr",y,sep="")
dailyhist_TP[[datayr]] <- aggregate(lat~time,data_TP[[datayr]],hist,breaks=seq(17,58))
}
#lot(dailyhist_eastCh$yr1980[150,2][[5]][],dailyhist_eastCh$yr1980[180,2][[3]],type='h')
