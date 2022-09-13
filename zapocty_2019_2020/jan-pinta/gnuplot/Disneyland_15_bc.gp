set terminal png
set datafile separator ";"
set xdata time
set timefmt "%m/%d/%Y"
set xrange ["08/03/1986":"04/09/1988"]
set xtics "08/03/1986", 10627200, "04/09/1988"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Koncentrace H_3BO_3"
set output "graphs/Disneyland_15_bc.png"
plot "data/data41.csv" using 1:4 with points pointtype 1 lt rgb "green" notitle
