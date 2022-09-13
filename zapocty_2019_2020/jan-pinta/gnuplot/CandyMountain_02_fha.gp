set terminal png
set datafile separator ";"
set xdata time
set timefmt "%Y-%m-%d"
set xrange ["1995-05-06":"1996-12-29"]
set xtics "1995-05-06", 10368000, "1996-12-29"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Pokazetový koeficient nevyrovnání výkonu"
set output "graphs/CandyMountain_02_fha.png"
plot "data/data5.csv" using 1:3 with points pointtype 1 lt rgb "blue" notitle
