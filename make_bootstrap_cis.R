samplemean <- function(x, d) {
  #randday <- mat.or.vec(length(d),1)  
  #print(d) 
  #print(length(x[d[1] , ])) 
  #for ( i in seq(1,length(d))) {
  #  tmpdata <- x[d[i],]  # d is vector of years 
    # for a randomly chosen year (d[i]), resample the days and find the mean
   # randday[i] <-  mean(sample(tmpdata, size = 9,replace = TRUE))  
    # randday[i] is the mean of 9 random days in the window for year d[i]
#  } 
  return(mean(x[d]))
}

make_bootstrap_cis <- function(data, dmin, dmax, ymin, ymax, reps){
confis <-  mat.or.vec(length(dmin:dmax), 3)
#confis <- list()

for(d in dmin:dmax){
    big_vec = mat.or.vec(ymax-ymin+1,1)
    i = 1
    for (y in ymin:ymax){
       datayr <- paste("yr",y,sep ="")
      # tmpdata = rollapply(dailymnEC[[datayr]]$lat, 5, mean) # take the 5 day running mean
       tmpdata = data[[datayr]]$lat
 
       big_vec[i] = tmpdata[d]  # put the running mean of the indexed day here 
       i = i + 1
       }

# now we have a vector with 22 years of running mean jet latitude on a given day 
# resample it

bootobject <- boot(data = big_vec, statistic = samplemean, R = reps)
tmp  <- boot.ci(bootobject, conf = 0.95, type = 'basic') # or should I use type = 'norm'? 
confis[(d+1)-dmin,2:3] <-tmp$basic[4:5] # or should I use type = 'norm'? 
confis[(d+1)-dmin,1] <- tmp$t0 # or should I use type = 'norm'? 
}
return(confis)
}
