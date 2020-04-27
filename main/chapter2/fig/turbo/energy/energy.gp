set macro

# set text font and size
set terminal pdf enhanced font 'Helvetica,11' size 4,1.8
set encoding utf8
set termoption dash

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
set style line  1 linetype  5 linecolor rgbcolor  blue_050 linewidth @my_line_width
set style line  2 linetype  4 linecolor rgbcolor brown_050 linewidth @my_line_width
set style line  3 linetype  7 linecolor rgbcolor green_050 linewidth @my_line_width
set style line  4 linetype  6 linecolor rgbcolor   red_050 linewidth @my_line_width

# this is to use the user-defined styles we just defined.
set style increment user

# set the color and width of the axis border
set border 31 lw @my_axis_width lc rgb text_color

# set key options
#set key outside;
set key top right width 2.0 height 0.3 font 'Helvetica, 11'

# set grid color
set grid lc rgb grid_color

# end define plot styles ######################################################

#set logscale y 2
set xtics ("1" 1, "2" 2, "3" 3, "4" 4)
#set xrange [1024:6144]

set title "Energy-per-bit (E_b) depending on the number of cores"
set xlabel "Number of cores"
set ylabel "Energy-per-bit (nJ)"

set output "./energy.pdf"
datafile = "./dat/data.txt"
plot for [IDX=0:3] datafile using 1:(1000 * ($5*$8) / ($1 * $2 * $3)) i IDX with linespoint title columnheader(1)


