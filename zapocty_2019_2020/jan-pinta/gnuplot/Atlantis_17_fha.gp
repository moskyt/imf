set terminal png
set datafile separator ";"
set xdata time
set timefmt "%Y-%m-%d"
set xrange ["1996-09-19":"1998-02-23"]
set xtics "1996-09-19", 8985600, "1998-02-23"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Pokazetový koeficient nevyrovnání výkonu"
set output "graphs/Atlantis_17_fha.png"
plot "data/data48.csv" using 1:2 with points pointtype 1 lt rgb "blue" notitle
