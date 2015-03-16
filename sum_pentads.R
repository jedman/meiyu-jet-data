source('make_hist_sums.R') 
sum_pentads <- function(ymin,ymax){
total = array(0,c(4,41, length(ymin:ymax))) 
eastCh_june<- list() 
i=1
for (y in ymin:ymax) { 
datayr=paste('yr',y,sep='') 
eastCh_june[[datayr]] <- sum_hist(y) 
total[,,i]=unlist(eastCh_june[[datayr]])
i=i+1
}
eastCh_june <- apply(total,c(1,2),mean) 
return(eastCh_june) 
}
