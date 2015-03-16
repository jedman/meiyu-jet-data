#read in jet data and reformat the date column as date objects
library(zoo)
data <- list()
for (y in 1958:2001){
datayr<- paste("yr",y,sep="")
for (i in 1:12){
	if (i < 10){	
		datatmp <- read.table(gzfile(paste("data/pe40_wind_",y,"0",i,".asc.gz",sep="")), header=TRUE)
		time <- as.POSIXlt(as.Date(datatmp$time,format="%Y/%m/%d %H"))
		datatmp$time <- as.Date(time)

	if (i==1){data[[datayr]] <- datatmp}
	else{data[[datayr]] <- rbind(data[[datayr]],datatmp) }
} else{ 

	datatmp <- read.table(gzfile(paste("data/pe40_wind_",y,i,".asc.gz",sep="")), header=TRUE)
	time <- as.POSIXlt(as.Date(datatmp$time,format="%Y/%m/%d %H"))
	datatmp$time <- as.Date(time)	
	data[[datayr]] <- rbind(data[[datayr]],datatmp) 
} 
}
}
