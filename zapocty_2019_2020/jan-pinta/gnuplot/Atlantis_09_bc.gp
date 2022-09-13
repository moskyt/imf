set terminal png
set datafile separator ";"
set xdata time
set timefmt "%Y-%m-%d"
set xrange ["1983-08-01":"1985-05-23"]
set xtics "1983-08-01", 11404800, "1985-05-23"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Koncentrace H_3BO_3"
set output "graphs/Atlantis_09_bc.png"
plot "data/data27.csv" using 1:4 with points pointtype 1 lt rgb "green" notitle
