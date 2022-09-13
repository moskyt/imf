set terminal png
set datafile separator ";"
set xdata time
set timefmt "%m/%d/%Y"
set xrange ["05/20/1998":"03/26/2000"]
set xtics "05/20/1998", 11664000, "03/26/2000"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Pokazetový koeficient nevyrovnání výkonu"
set output "graphs/Atlantis_14_fha.png"
plot "data/data43.csv" using 1:3 with points pointtype 1 lt rgb "blue" notitle
