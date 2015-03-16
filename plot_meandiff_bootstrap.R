plot_meandiff_bootstrap <- function(confis_pos, sampdates , win){ 
library(zoo) 

dates = rollapply(sampdates,win,mean)
confis_late <- rollapply(confis_pos,win,mean) 

plot(dates, confis_late[,1], type ='l',lwd=3, col='black', ylab="latitude", xlab = 'date',ylim = c(-4,3),xlim =as.Date(c("1980-04-05", "1980-10-01")), lty=2, xaxt = 'n')

polygon(c(dates, rev(dates)), c(confis_late[,2], rev(confis_late[,3])), col = rgb(0.5, 0, 0,0.1), border= NA)

#grid() 
#axis(1, tck = 1, col.ticks='light gray') 
axis(2, tck = 1, col.ticks='light gray')
#minor.tick(nx=1, ny=1, tick.ratio=0.5)

datelabels = seq(as.Date('1980-04-01'), as.Date('1980-11-01'),by = 'month') 
axis(1, at = datelabels, labels = format(datelabels, "%b")) 
title('Difference in mean jet latitude, with 95% confidence interval')  

#legend('bottomright', c( '1958-1979', '1980-2001') , lwd =c(3,3), col=c('blue','red'), lty=c(1,2))

}
