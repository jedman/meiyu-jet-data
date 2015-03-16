plot_latlon_all <- function(data,filename,date){
pdf(filename, height=4,width=4)  
smoothScatter(data$lon, data$lat,xlab = 'longitude',ylab ='latitude',main=date,   ylim=c(27,58),nrpoints=0 ) 
dev.off() 
}
