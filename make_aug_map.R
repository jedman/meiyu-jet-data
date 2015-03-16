library(KernSmooth) 
source('make_latlon_composite.R')
test <- make_latlon_composite('08-01','08-10', 0.1, 'july') 
junpos <- est_kernel(test$pos) 
junneg <- est_kernel(test$neg) 
dev.new()
filled.contour(junpos$x1, junpos$x2, junpos$fhat,xlim=c(90,130), ylim=c(27,58),zlim = c(0,0.0035),color.palette = terrain.colors, plot.axes = {axis(1); axis(2); map('worldHires',xlim = c(90,130), ylim = c(20,60),interior=TRUE, add=TRUE)}, ylab='latitude', xlab='longitude')
title('Low') 
dev.new()
filled.contour(junneg$x1, junneg$x2, junneg$fhat,xlim=c(90,130), ylim=c(27,58), zlim = c(0,0.0035),color.palette = terrain.colors,plot.axes = {axis(1); axis(2); map('worldHires',xlim = c(90,130), ylim = c(20,60),interior=TRUE, add=TRUE)}, ylab='latitude', xlab='longitude')
title('High') 

loc<- list()
loc$x <- junneg$x1
loc$y <- junneg$x2
jn <- list()
jn$x <- junpos$x1
jn$y <- junpos$x2
jn$z <- junpos$fhat
junpos_int <- interp.surface.grid(jn, loc)
dev.new() 

filled.contour(junneg$x1, junneg$x2, junneg$fhat - junpos_int$z,xlim=c(90,130), ylim=c(27,58), color.palette = terrain.colors,plot.axes = {axis(1); axis(2); map('worldHires',xlim = c(90,130), ylim = c(20,60),interior=TRUE, add=TRUE)}, ylab='latitude', xlab='longitude')
title('High-Low') 


