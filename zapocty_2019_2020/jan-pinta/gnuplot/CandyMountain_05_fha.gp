set terminal png
set datafile separator ";"
set xdata time
set timefmt "%Y-%m-%d"
set xrange ["1993-01-23":"1994-09-29"]
set xtics "1993-01-23", 10627200, "1994-09-29"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Pokazetový koeficient nevyrovnání výkonu"
set output "graphs/CandyMountain_05_fha.png"
plot "data/data16.csv" using 1:4 with points pointtype 1 lt rgb "blue" notitle
