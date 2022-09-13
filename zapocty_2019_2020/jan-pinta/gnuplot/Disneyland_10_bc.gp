set terminal png
set datafile separator ";"
set xdata time
set timefmt "%m/%d/%Y"
set xrange ["10/02/1989":"05/07/1991"]
set xtics "10/02/1989", 10022400, "05/07/1991"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Koncentrace H_3BO_3"
set output "graphs/Disneyland_10_bc.png"
plot "data/data29.csv" using 1:4 with points pointtype 1 lt rgb "green" notitle
