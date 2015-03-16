#take a subset of the raw jet data
# this is for the TP region, longitude 80 to 93
#data_TP <- list()
#data_eastCh <- list()
#data_Sch <- list()
#data_eastChbig <- list() 
#data_lat_eastChbig <- list() 
#data_u_eastChbig <- list() 
#data_umn_eastChbig <- list() 
#data_eastCh <- list()
data_westpac <- list()  
for (y in 1958:2001){
datayr<- paste("yr",y,sep="")
#data_TP[[datayr]] <- subset(data[[datayr]],lon>75 & lon <105)
#data_eastCh[[datayr]] <- subset(data[[datayr]],lon >=105 & lon <122) 
#data_Sch[[datayr]] <- subset(data[[datayr]],lon >=80 & lon <90)
#data_eastChbig[[datayr]] <- subset(data[[datayr]], lon >= 90 & lon <= 130 ) 
#data_lat_eastChbig[[datayr]] <- subset(data[[datayr]], lon >= 90 & lon <= 130 & lat >= 20 & lat <= 50 ) 
#data_u_eastChbig[[datayr]] <- subset(data[[datayr]], lon >= 90 & lon <= 130 & u >= 30 ) 
#data_umn_eastChbig[[datayr]] <- subset(data[[datayr]], lon >= 90 & lon <= 130 & u >= 40 ) 
#data_eastCh[[datayr]] <- subset(data[[datayr]], lon >= 105 & lon <= 130 ) 
data_westpac[[datayr]] <- subset(data[[datayr]], lon >= 115 & lon <= 140 )
}
