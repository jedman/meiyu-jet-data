library(KernSmooth) 
library(fields) 
source('make_latlon_composite.R')
test <- make_latlon_composite('06-11','06-20', 0.1,'june') 
min_lev <- 0.0015
junpos <- est_kernel(test$pos) 
junneg <- est_kernel(test$neg) 
index <- which(junpos$fhat < min_lev) 
junpos_fhat<- junpos$fhat 
junpos_fhat[index] <- NA 
index <- which(junneg$fhat < min_lev) 
junneg_fhat<- junneg$fhat 
junneg_fhat[index] <- NA 
dev.new()
filled.contour(junneg$x1, junpos$x2, junpos_fhat,xlim=c(90,130), ylim=c(22,58),zlim = c(min_lev,0.003),color.palette = terrain.colors, plot.axes = {axis(1); axis(2); map('worldHires',xlim = c(90,130), ylim = c(20,60),interior=TRUE, add=TRUE)}, ylab='latitude', xlab='longitude')
title('Low') 
dev.new()
filled.contour(junneg$x1, junneg$x2, junneg_fhat,xlim=c(90,130), ylim=c(22,58), zlim = c(min_lev,0.003),color.palette = terrain.colors,plot.axes = {axis(1); axis(2); map('worldHires',xlim = c(90,130), ylim = c(20,60),interior=TRUE, add=TRUE)}, ylab='latitude', xlab='longitude')
title('High')
dev.new()  

loc<- list() 
loc$x <- junpos$x1 
loc$y <- junpos$x2 
jn <- list() 
jn$x <- junneg$x1
jn$y <- junneg$x2 
jn$z <- junneg$fhat 
junneg_int <- interp.surface.grid(jn, loc) 
tmpdiff <- junneg_int$z - junpos$fhat 
index <- which(abs(tmpdiff) < 0.0005)
tmpdiff[index] <- NA
filled.contour(junpos$x1, junpos$x2, tmpdiff,xlim=c(90,130), ylim=c(22,58),color.palette = terrain.colors, plot.axes = {axis(1); axis(2); map('worldHires',xlim = c(90,130), ylim = c(20,60),interior=TRUE, add=TRUE)}, ylab='latitude', xlab='longitude')

title('High-Low')
