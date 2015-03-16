samplemean <- function(x, d) {
  randday <- mat.or.vec(length(d),1)
      #print(d)
      #print(length(x[d[1] , ]))
  for ( i in seq(1,length(d))) {
         tmpdata <- x[d[i],]
      #  print(tmpdata)
         randday[i] <-  mean(sample(tmpdata, size = 9,replace = TRUE))
     }
    return (mean(randday))
 #   return(mean(x[d]))
# d is the vector of indices for bootstrapped years
}
make_2samp_bootstrap_windowed <- function(data, dmin, dmax, ymin, ymax,ymin2,ymax2,reps, alpha){
# find the mean difference and the confidence interval early and late periods 
win <- 4
confis <-  mat.or.vec(length(dmin:dmax), 3)
meandiff <-  mat.or.vec(length(dmin:dmax), 3)
#confis <- list()

for(d in dmin:dmax){
    big_vec = mat.or.vec(ymax-ymin+1, 2*win + 1)
    big_vec2 = mat.or.vec(ymax2-ymin2 + 1, 2*win + 1)
    wmin <- d - win
    wmax <- d + win
     i = 1
    for (y in ymin:ymax){
       datayr <- paste("yr",y,sep ="")
      # tmpdata = rollapply(dailymnEC[[datayr]]$lat, 5, mean) # take the 5 day running mean
       tmpdata = data[[datayr]]$lat
 
       big_vec[i,] = tmpdata[wmin:wmax]  # put the running mean of the indexed day here 
       i = i + 1
       }
    i = 1 
    for (y in ymin2:ymax2){
       datayr <- paste("yr",y,sep ="")
      # tmpdata = rollapply(dailymnEC[[datayr]]$lat, 5, mean) # take the 5 day running mean
       tmpdata = data[[datayr]]$lat
 
       big_vec2[i,] = tmpdata[wmin:wmax]  # put the mean of the indexed day here 
       i = i + 1
       }


# now we have two vectors, each with 22 years of mean jet latitude on a given day 
# resample each vector, and find the difference of each resampling. 
sampdiff <- mat.or.vec(reps,1)
for (i in 1:reps){
     index1 <- sample(ymax-ymin, ymax-ymin, replace = TRUE)  
     index2 <- sample(ymax2-ymin2, ymax2-ymin2, replace = TRUE) 
     samp1 <- samplemean(big_vec, index1) 
     samp2 <- samplemean(big_vec2, index2) 
     sampdiff[i] <- samp2 - samp1 
}


meandiff[(d+1)-dmin,1] <- mean(sampdiff) 

meandiff[(d+1)-dmin,2:3] <-quantile(sampdiff, c(alpha/2.,1.-alpha/2.)) # or should I use type = 'norm'? 
}
return(meandiff)
}
