plot_composite_cutoff <- function(data,win,confis_pos, confis_neg){ 
library(zoo) 

dates = rollapply(dailymnECbig$yr1980$time[data[[3]]],win,mean)
data1 = rollapply(data[[1]],win,mean)
data2 = rollapply(data[[2]],win,mean)
sd1 = rollapply(data[[4]], win,mean) 
sd2 = rollapply(data[[5]], win,mean) 
confis_late <- rollapply(confis_pos,win,mean) 
confis_early <- rollapply(confis_neg,win,mean) 
plot(dates, data1, type ='l',lwd=3, col='red', ylab="latitude", xlab = 'date',xlim =as.Date(c("1980-04-05", "1980-10-01")),ylim=c(36,47), lty=2, xaxt = 'n')
polygon(c(dates, rev(dates)), c(confis_late[,1], rev(confis_late[,2])), col = rgb(1, 0, 0,0.2), border= NA)
polygon(c(dates, rev(dates)), c(confis_early[,1], rev(confis_early[,2])), col = rgb(0, 0, 1,0.2), border= NA)

#lines(dates,data1, lwd = 3, col = 'red', lty= 2) 
lines(dates, data2, col='blue',lwd =3, lty=1)
#lines(dates, confis_late[,1], col='red',lwd =3, lty=7)
#lines(dates, confis_early[,1], col='gray',lwd =3, lty=2)
#lines(dates, confis_late[,2], col='red',lwd =3, lty=7)
#lines(dates, confis_early[,2], col='gray',lwd =3, lty=2)
#grid() 
#axis(1, tck = 1, col.ticks='light gray') 
axis(2, tck = 1, col.ticks='light gray')
#minor.tick(nx=1, ny=1, tick.ratio=0.5)

datelabels = seq(as.Date('1980-04-01'), as.Date('1980-11-01'),by = 'month') 
axis(1, at = datelabels, labels = format(datelabels, "%b")) 
 

legend('bottomright', c( '1958-1979', '1980-2001') , lwd =c(3,3), col=c('blue','red'), lty=c(1,2))

}
