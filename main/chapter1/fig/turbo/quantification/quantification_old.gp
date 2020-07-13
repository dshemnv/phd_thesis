set macro

# set text font and size
set terminal pdf enhanced font 'Helvetica,11' size 4,2.65
set encoding utf8

set tmargin 0.3
set bmargin 3.2

# start define plot styles ####################################################
# Palette URL:
# http://colorschemedesigner.com/#3K40zsOsOK-K-

black      = "#000000"
red_000    = "#F9B7B0"
red_025    = "#F97A6D"
red_050    = "#E62B17"
red_075    = "#8F463F"
red_100    = "#6D0D03"

blue_000   = "#A9BDE6"
blue_025   = "#7297E6"
blue_050   = "#1D4599"
blue_075   = "#2F3F60"
blue_100   = "#031A49"

green_000  = "#A6EBB5"
green_025  = "#67EB84"
green_050  = "#11AD34"
green_075  = "#2F6C3D"
green_100  = "#025214"

brown_000  = "#F9E0B0"
brown_025  = "#F9C96D"
brown_050  = "#E69F17"
brown_075  = "#8F743F"
brown_100  = "#6D4903"

grid_color = "#6a6a6a"
text_color = "#6a6a6a"

my_line_width = "2.00"
my_axis_width = "1.2"
my_ps = "0.90"

set pointsize @my_ps

# set the style for the set 1, 2, 3...
set style line 1 linetype 2  linecolor rgbcolor     black linewidth @my_line_width
set style line 2 linetype 5  linecolor rgbcolor  blue_050 linewidth @my_line_width
set style line 3 linetype 4  linecolor rgbcolor  blue_025 linewidth @my_line_width
set style line 4 linetype 7  linecolor rgbcolor green_050 linewidth @my_line_width
set style line 5 linetype 6  linecolor rgbcolor green_025 linewidth @my_line_width
set style line 6 linetype 9  linecolor rgbcolor  blue_025 linewidth @my_line_width
set style line 7 linetype 8  linecolor rgbcolor green_025 linewidth @my_line_width
set style line 8 linetype 11 linecolor rgbcolor brown_025 linewidth @my_line_width
set style line 9 linetype 10 linecolor rgbcolor   red_025 linewidth @my_line_width

# this is to use the user-defined styles we just defined.
set style increment user

# set the color and width of the axis border
set border 31 lw @my_axis_width lc rgb text_color

# set key options
#set key bottom left width -3 height 0 font 'Helvetica, 8'
set key top right width -2 height 0 font 'Helvetica, 11'

# set grid color
#set grid lc rgb grid_color

set grid ytics mytics
set mytics 10
set grid layerdefault linetype -1 linecolor rgb "gray" linewidth 0.200, linetype 0 linecolor rgb "gray"  linewidth 0.100
set samples 300, 300

set datafile separator "|"

#set format y '%.0e'
set format y "10^{%T}"
set logscale y 10

# end define plot styles ######################################################


###################################################################### K = 6144
set style line 1 linetype 2  linecolor rgbcolor     black linewidth @my_line_width
set style line 2 linetype 4  linecolor rgbcolor  blue_050 linewidth @my_line_width
#set style line 3 linetype 5  linecolor rgbcolor  blue_025 linewidth @my_line_width
set style line 3 linetype 6  linecolor rgbcolor green_050 linewidth @my_line_width
set style line 4 linetype 7  linecolor rgbcolor green_025 linewidth @my_line_width

set output "./bfer_old.pdf"
#set multiplot layout 1,2 title "{/:Bold=11 Turbo decoder LTE-A (K = 6144, 6 iters, R=1/3, SF=0.75, scale-max-log-MAP)}"
set multiplot layout 1,2

datafile = "./dat/data_6144.txt"
set xlabel "E_b/N_0 (dB)"
set ylabel "BER"
plot for [IDX=0:2] datafile using 1:5 i IDX with linespoint title columnheader(1)

set key off
set xlabel "E_b/N_0 (dB)"
set ylabel "FER"
plot for [IDX=0:2] datafile using 1:6 i IDX with linespoint title columnheader(1)

unset multiplot
###############################################################################
