plot_composite <- function(data,win){ 
library(zoo) 

dates = rollapply(dailymnECbig$yr1980$time[data[[3]]],win,mean)
data1 = rollapply(data[[1]],win,mean)
data2 = rollapply(data[[2]],win,mean)
plot(dates, data1, type ='l',lwd=3, col='red', ylab="latitude", xlab = 'date',ylim=c(36,46), lty=2, xaxt = 'n')
#plot(dates, data1, type ='l',lwd=3, col='red', ylab="latitude", xlab = 'date', lty=2, xaxt = 'n')
lines(dates, data2, col='black',lwd =3, lty=1)
#grid() 
#axis(1, tck = 1, col.ticks='light gray') 
axis(2, tck = 1, col.ticks='light gray')
#minor.tick(nx=1, ny=1, tick.ratio=0.5)

datelabels = seq(as.Date('1980-04-01'), as.Date('1980-11-01'),by = 'month') 
axis(1, at = datelabels, labels = format(datelabels, "%b")) 
 

legend('bottomright', c( '1958-1979', '1980-2001') , lwd =c(3,3), col=c('black','red'), lty=c(1,2))

}
