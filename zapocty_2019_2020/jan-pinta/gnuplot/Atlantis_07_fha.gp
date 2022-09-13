set terminal png
set datafile separator ";"
set xdata time
set timefmt "%Y-%m-%d"
set xrange ["1985-11-17":"1987-05-26"]
set xtics "1985-11-17", 9590400, "1987-05-26"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Pokazetový koeficient nevyrovnání výkonu"
set output "graphs/Atlantis_07_fha.png"
plot "data/data20.csv" using 1:4 with points pointtype 1 lt rgb "blue" notitle
