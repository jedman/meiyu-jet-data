plot_composite_filt <- function(data, min, max, win){ 
library(zoo) 
year<- seq(as.Date(paste('1999','-',min,sep='')), to= as.Date(paste('1999','-',max, sep='')), by ='1 day'  )
plot(rollapply(year, win,mean),rollapply(data[[1]],win,mean), type ='l',lwd=3, col='red', ylab="latitude", xlab = 'date',ylim=c(34,46), lty=2)
line
lines(rollapply(year,win,mean),rollapply(data[[2]],win,mean),col='black',lwd =3, lty=1)

legend('bottomright', c('high', 'low'), lwd =c(3,3), col=c(1,2), lty=c(1,2))

}
