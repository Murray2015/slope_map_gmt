# Slope_map.sh 

Bash shell script that takes a topography (or bathymetry) NetCDF grid file, and outputs a map of the maximum slope angle in degrees. 

## Usage 
`./slope_map.sh [path_to_topography_grid_file]`

## Outputs 
slope.nc - NetCDF grid file in radians 
slope2.nc - NetCDF grid file in degrees 
outmap.ps - Postscript map of slope in degrees

## Dependencies
Bash
Generic Mapping Tools
