make_2D_netcdf <- function(filename,vars) {

   library(ncdf)
   
   names <- names(vars)
   i = 1 
   # Make vardef
   vardef <- list()
   dimdef <- list() 
   for (name in names(vars)) {
     dimdef[[name]]$latdim <- dim.def.ncdf('latitude','deg',vars[[name]]$data$lat)
     dimdef[[name]]$londim <- dim.def.ncdf('longitude', 'deg',vars[[name]]$data$lon)
      vardef[[name]] <- var.def.ncdf(name,'density', list(dimdef[[name]]$latdim, dimdef[[name]]$londim),
         missval=-999)
     i = i+1
   }

   # Create the NetCDF file with vardef
   nc <- create.ncdf(filename,vardef)

   # Fill the NetCDF with data
   for (name in names(vars)) {
      put.var.ncdf(nc,name,vars[[name]]$data$kd)
   }

   close.ncdf(nc)

}
   
