#!/bin/bash

time(awk -F ';' 'NR>2 && !visited[$1]++ {count[$6]++} END {for (item in count) print count[item], item}' data.csv | sort -nr -t ';' -k1 | head -10 | sed 's/\(.*\) \([^ ]*\) /\1;\2 /' > d1.txt)


gnuplot << EOF
set terminal pngcairo enhanced font "arial,10" size 800,600
set output 'graph1.png'
set title "Top 10 Conducteurs par Routes parcourue"
set style data histogram
set style fill solid
set xlabel "Conducteurs"
set ylabel "NB Routes"
set ytics rotate by 90
set xtics rotate out
set boxwidth 0.5
set grid x
set datafile separator ";"
plot 'd1.txt' using 1:xtic(2) with boxes lc rgb "black" notitle

EOF

convert graph1.png -rotate 90 d1.png



rm graph1.png
