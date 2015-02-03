#!/bin/bash 

# The thest data to work with in this story is 

echo '
Date  Level_0_Mins  Level_1_Mins  Level_2_Mins
2011-01-08  30.34 22.58 161.08
2011-01-15  23.83 20.33 104.00
2011-01-22  50.50 16.17 79.75
2011-01-29  67.59 21.74 99.25
2011-02-05  37.58 33.33 155.33
2011-02-12  48.17 44.33 66.00
2011-02-19  89.34 12.42 91.42
2011-02-26  113.09  35.83 123.34
2011-04-02  174.25  105.25  221.25
2011-04-09  98.09 55.92 109.00
2011-04-16  98.67 30.83 202.00
2011-04-23  87.17 58.25 127.09
2011-04-30  139.74  67.33 232.84
2011-04-30  20.0  10.0  30.0
' > data1.txt

#First of all 
gnuplot -persist << EOF

reset
clear

set xdata time
set timefmt "%Y-%m-%d"
set format x "%Y-%m-%d"

set terminal x11

# If we don't use columnhead, the first line of the data file
# will confuse gnuplot, which will leave gaps in the plot.
set key top left outside horizontal autotitle columnhead

set xtics rotate by 90 offset 0,-5 out nomirror
set ytics out nomirror

set style fill solid border -1

# Make the histogram boxes half the width of their slots.
set boxwidth 1.0 relative

# Select histogram mode.

# Select a row-stacked histogram.

set auto x

plot "data1.txt" using 1:(\$2+\$3+\$4) with filledcurves x1, \
       "" using 1:(\$3+\$4) with filledcurves x1, \
       "" using 1:4 with filledcurves x1

EOF
