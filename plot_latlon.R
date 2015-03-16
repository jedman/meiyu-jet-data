plot_latlon <- function(data,filename){
pdf(filename, height=3,width=6)  
par(mfrow=c(1,2),mar=c(4,4,2,0))
smoothScatter(data$neg$lon, data$neg$lat,xlab = 'longitude', ylab = 'latitude', main ='High',ylim=c(27,58))
par(mar=c(4,2,2,2))
smoothScatter(data$pos$lon, data$pos$lat,xlab = 'longitude',ylab ='',  main='Low', ylim=c(27,58), yaxt="n") 
dev.off() 
}
