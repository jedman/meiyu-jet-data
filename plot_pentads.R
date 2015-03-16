dev.new()
#par(cex=2)
par(oma=c(0,0,2,0),cex=1.5)
par(mar=c(1,2,1,1))
par(mfrow=c(4,1))
for(y in 1:4){
plot(dailyhist_eastCh$yr1980[1,2][[5]],mean_pentads_TP_later[y,],type='h',xlab='latitude',ylab='frequency',main=y,lwd=2)
} 
title(main='1990-2001 May-June jet locations, Tibetan Plateau',cex= 1.5,outer=T)

