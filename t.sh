#!/bin/bash

cat data.csv|cut -d ";" -f2,3 > villesA.txt
cat data.csv|cut -d ";" -f2,4 > villesB.txt

gcc t.c -o t
./t > t.txt

gnuplot << EOF
set terminal png
set output "t.png"
set title "Les 10 villes les plus traversées"
set style data histogram
set style fill solid
set ylabel "NB ROUTES"
set xlabel "Noms des villes"
set xtic rotate by -45
set style histogram clustered
set datafile separator ';'

plot "t.txt" using 2:xtic(1) title "Première ville", \
     '' using 3:xtic(1) title "routes totales"

EOF
