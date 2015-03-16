library(KernSmooth) 
library(fields) 
source('est_kernel.R')
source('make_latlon_composite_all.R')
kd_est <- list() 
kd_est$spring$dates <- seq(61,120)
kd_est$prem$dates <- seq(121,160)
kd_est$meiyu$dates <- seq(161,200)
kd_est$postm1$dates <- seq(201,250)
kd_est$postm2$dates <- seq(201,273)
kd_est$fall$dates <- seq(274,320)
i = 1 
for (period in kd_est){
period_comp <- make_latlon_composite_all(period$dates, seq(1958,2001)) 
k_est <- est_kernel(period_comp) 
kd_est[[i]]$data$lon <- k_est$x1
kd_est[[i]]$data$lat <- k_est$x2
kd_est[[i]]$data$kd <- k_est$fhat
i = i + 1
} 
# write to netcdf? 
source('make_2D_netcdf.R')
make_2D_netcdf('composites.nc', kd_est)

kd_diff <- list()
kd_diff$prem$dates <- seq(121,150) 
kd_diff$postm1$dates <- seq(201,250)
i = 1
for (period in kd_diff){
  period_comp_ear <- make_latlon_composite_all(period$dates, seq(1958,1979)) 
  period_comp_lat <- make_latlon_composite_all(period$dates, seq(1980,2001)) 
  k_est_ear <- est_kernel(period_comp_ear)
  k_est_lat <- est_kernel(period_comp_lat)
  kd_diff[[i]]$data$lon <- k_est_ear$x1
  kd_diff[[i]]$data$lat <- k_est_ear$x2
  kd_diff[[i]]$data$kd <- k_est_lat$fhat - k_est_ear$fhat
  i = i+1
}
make_2D_netcdf('differences.nc', kd_diff)


