# script to resample jet data to compute standard deviation of 20 year means 
library(zoo) # for rollapply 
library(boot) 

#define statistic to be used on resampled datasets 
samplemean <- function(x, d) {
  return(mean(x[d]))
}
win = 5 #days

# read the data from a period into a matrix
ymin = 1958 
ymax = 1979 

dmin = 80 
dmax = 290 
confis <-  mat.or.vec(length(dmin:dmax), 2) 
#confis <- list()

for(d in dmin:dmax){ 
    big_vec = mat.or.vec(ymax-ymin+1,1) 
    i = 1  
    for (y in ymin:ymax){ 
       datayr <- paste("yr",y,sep ="")  
      # tmpdata = rollapply(dailymnEC[[datayr]]$lat, 5, mean) # take the 5 day running mean
       tmpdata = dailymnECbig[[datayr]]$lat 
  
       big_vec[i] = tmpdata[d]  # put the running mean of the indexed day here 
       i = i + 1 
       } 

# now we have a vector with 22 years of running mean jet latitude on a given day 
# resample it
bootobject <- boot(data = big_vec, statistic = samplemean, R = 10000)

confis[(d+1)-dmin,1:2] <- boot.ci(bootobject, conf = 0.95, type = 'basic')$basic[4:5] # or should I use type = 'norm'? 

}
