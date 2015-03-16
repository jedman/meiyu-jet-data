df <- data.frame(row.names = years)
#for(y in seq(121,150, by =10)){
int <- 9
stuff <- c(seq(121,150, by = 10), seq(201,260, by = 10)) 
for (y in stuff){
index <- seq(y, y+int)
day <- paste("day",y,sep="")
daymn <- paste("meanday",y,sep="")
df[[day]] <- extract_anoms(index) - mean(extract_anoms(index))
df[[daymn]] <- mean(extract_anoms(index))
}