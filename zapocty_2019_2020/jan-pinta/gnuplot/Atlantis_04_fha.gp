set terminal png
set datafile separator ";"
set xdata time
set timefmt "%Y-%m-%d"
set xrange ["1991-01-16":"1992-10-27"]
set xtics "1991-01-16", 11232000, "1992-10-27"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Pokazetový koeficient nevyrovnání výkonu"
set output "graphs/Atlantis_04_fha.png"
plot "data/data8.csv" using 1:2 with points pointtype 1 lt rgb "blue" notitle
