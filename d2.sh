#!/bin/bash

time(awk -F ';' '{totals[$6] += $5} END {for (driver in totals) print totals[driver], driver}' data.csv | sort -nr | head -n 10  > d2.txt)

gnuplot << EOF
set terminal pngcairo enhanced font "arial,10" size 800,600
set output 'graph2.png'
set title "Top 10 Conducteurs par Distance parcourue"
set style data histogram
set style fill solid
set xlabel "Conducteurs"
set ylabel "Distance"
set ytics rotate by 90
set xtics rotate out
set boxwidth 0.5
set grid x
set datafile separator " "
plot 'd2.txt' using 1:xtic(2) with boxes lc rgb "black" notitle
EOF

convert graph2.png -rotate 90 d2.png

rm graph2.png


