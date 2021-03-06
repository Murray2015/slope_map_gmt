#!/bin/bash

### This script takes a bathymetry NetCDF grid file, and outputs a map of the maximum slope angle, in degrees.

# Set global vars
gmtset PS_MEDIA A3 MAP_FRAME_TYPE plain
file=$1

# Calculate gradients
grdgradient $file -D -Sslope.nc -fg
grdmath slope.nc ATAN PI DIV 180 MUL = slope2.nc

# Make map
rgn=`grdinfo slope2.nc -I0.001`
prj=-JM6i
makecpt -T0/15/1 -Crainbow > slope.cpt
grdimage slope2.nc $prj $rgn -Cslope.cpt -P -K > outmap.ps
psscale -D6.5i/3i+w2i/0.25i+e -Cslope.cpt -B5+l"Degrees" -K -O >> outmap.ps
pscoast $rgn $prj -Dh -Ggray10 -W0.1 -Bx10g10 -By5g5 -BNESW+t"Slope Map Rockall Area" -O >> outmap.ps

# Make jpg
convert -trim -bordercolor white -border 30x30 -quality 100 -density 600 outmap.ps rockall_slope_map.jpg
eog *jpg

exit
