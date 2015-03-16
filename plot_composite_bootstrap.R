plot_composite_bootstrap <- function(confis_pos, confis_neg, sampdates , win){ 
library(zoo) 

dates = rollapply(sampdates,win,mean)
confis_late <- rollapply(confis_pos,win,mean) 
confis_early <- rollapply(confis_neg,win,mean) 

plot(dates, confis_late[,1], type ='l',lwd=3, col='red', ylab="latitude", xlab = 'date',ylim = c(36,47),xlim =as.Date(c("1980-04-01", "1980-10-10")), lty=2, xaxt = 'n')
#c(36,47) 
polygon(c(dates, rev(dates)), c(confis_late[,2], rev(confis_late[,3])), col = rgb(1, 0, 0,0.2), border= NA)
polygon(c(dates, rev(dates)), c(confis_early[,2], rev(confis_early[,3])), col = rgb(0, 0, 1,0.2), border= NA)

lines(dates,confis_late[,1], lwd = 3, col = 'red', lty= 2) 
lines(dates, confis_early[,1], col='blue',lwd =3, lty=1)
#grid() 
#axis(1, tck = 1, col.ticks='light gray') 
axis(2, tck = 1, col.ticks='light gray')
#minor.tick(nx=1, ny=1, tick.ratio=0.5)

datelabels = seq(as.Date('1980-01-05'), as.Date('1980-12-30'),by = 'month') 
axis(1, at = datelabels, labels = format(datelabels, "%b")) 
 

legend('bottomright', c( '1958-1979', '1980-2001') , lwd =c(3,3), col=c('blue','red'), lty=c(1,2))

}
