make_2samp_bootstrap <- function(data, dmin, dmax, ymin, ymax,ymin2,ymax2,reps, alpha){
# find the mean difference and the confidence interval early and late periods 

confis <-  mat.or.vec(length(dmin:dmax), 3)
meandiff <-  mat.or.vec(length(dmin:dmax), 3)
#confis <- list()

for(d in dmin:dmax){
    big_vec = mat.or.vec(ymax-ymin+1,1)
    big_vec2 = mat.or.vec(ymax2-ymin2 + 1,1)
    i = 1
    for (y in ymin:ymax){
       datayr <- paste("yr",y,sep ="")
      # tmpdata = rollapply(dailymnEC[[datayr]]$lat, 5, mean) # take the 5 day running mean
       tmpdata = data[[datayr]]$lat
 
       big_vec[i] = tmpdata[d]  # put the running mean of the indexed day here 
       i = i + 1
       }
    i = 1 
    for (y in ymin2:ymax2){
       datayr <- paste("yr",y,sep ="")
      # tmpdata = rollapply(dailymnEC[[datayr]]$lat, 5, mean) # take the 5 day running mean
       tmpdata = data[[datayr]]$lat
 
       big_vec2[i] = tmpdata[d]  # put the mean of the indexed day here 
       i = i + 1
       }


# now we have two vectors, each with 22 years of mean jet latitude on a given day 
# resample each vector, and find the difference of each resampling. 
sampdiff <- mat.or.vec(reps,1)
for (i in 1:reps){
   samp1 <- sample(big_vec, length(big_vec), replace = TRUE) 
   samp2 <- sample(big_vec2, length(big_vec2), replace = TRUE) 
   sampdiff[i] <- mean(samp2) - mean(samp1) 
}



bootobject <- boot(data = big_vec, statistic = samplemean, R = reps)
bootobject2 <- boot(data = big_vec2, statistic = samplemean, R = reps) 

means1 <- bootobject$t 
means2 <- bootobject2$t

meandiff[(d+1)-dmin,1] <- mean(sampdiff) 

meandiff[(d+1)-dmin,2:3] <-quantile(sampdiff, c(alpha/2.,1.-alpha/2.)) # or should I use type = 'norm'? 
}
return(meandiff)
}
