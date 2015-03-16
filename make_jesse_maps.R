library(KernSmooth) 
library(fields)
library(maps) 
library(mapdata) 
source('est_kernel.R') 
source('make_latlon_composite_cutoff.R')
test <- make_latlon_composite_cutoff(data_wide,'05-10','05-20', 1980) 
junpos <- est_kernel(test$pos) 
junneg <- est_kernel(test$neg) 
dev.new()
filled.contour(junpos$x1, junpos$x2, junpos$fhat,xlim=c(50,130), ylim=c(22,58),zlim = c(0,0.0015),color.palette = terrain.colors, plot.axes = {axis(1); axis(2); map('worldHires',xlim = c(90,130), ylim = c(20,60),interior=TRUE, add=TRUE)}, ylab='latitude', xlab='longitude')
title('1980-2001') 
dev.new()
filled.contour(junneg$x1, junneg$x2, junneg$fhat,xlim=c(50,130), ylim=c(22,58), zlim = c(0,0.0015),color.palette = terrain.colors,plot.axes = {axis(1); axis(2); map('worldHires',xlim = c(90,130), ylim = c(20,60),interior=TRUE, add=TRUE)}, ylab='latitude', xlab='longitude')
title('1958-1979')
dev.new()  

loc<- list() 
loc$x <- junpos$x1 
loc$y <- junpos$x2 
jn <- list() 
jn$x <- junneg$x1
jn$y <- junneg$x2 
jn$z <- junneg$fhat 
junneg_int <- interp.surface.grid(jn, loc) 

filled.contour(junpos$x1, junpos$x2, -junneg_int$z+junpos$fhat,xlim=c(50,130), ylim=c(22,58),color.palette = terrain.colors, plot.axes = {axis(1); axis(2); map('worldHires',xlim = c(90,130), ylim = c(20,60),interior=TRUE, add=TRUE)}, ylab='latitude', xlab='longitude')
title('Difference')
