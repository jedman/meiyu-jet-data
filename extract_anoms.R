extract_anoms <- function(index){
  tmp <- NULL 
  for (y in seq(1958, 2001)) {
    datayr <- paste('yr',y,sep='')
    x <- mean(dailymnwestpac[[datayr]]$lat[index])
    tmp <- c(tmp,x)
  }
  return(tmp) 
}