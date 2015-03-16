#requires KernSmooth
est_kernel <- function(dailyclim){
x<- mat.or.vec(length(dailyclim$lat),2) 
x[,1] = dailyclim$lon
x[,2] = dailyclim$lat
rangelon <- c(40,130)
rangelat <- c(15,60)
kernel <- bkde2D(x, c(1.0,1.0), range = list(rangelon,rangelat), truncate = FALSE)
return(kernel) 
}
