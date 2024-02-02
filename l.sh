#!/bin/bash
time(awk -F ';' '{totals[$1] += $5} END {for (route in totals) print totals[route], route}' data.csv | sort -nr | head -n 10 | sort -t ';' -k2n > l.txt)


gnuplot << EOF
set terminal png
set output "l.png"
set title "Les 10 trajets les plus longs"
set style data histogram
set style fill solid
set ylabel "distances"
set xlabel "routes"
set xtic rotate by -45
set style histogram clustered
set datafile separator ' '
set yrange [0:*]

plot "l.txt" using 1:xtic(2)  notitle 
EOF
