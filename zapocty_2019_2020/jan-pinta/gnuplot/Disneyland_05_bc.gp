set terminal png
set datafile separator ";"
set xdata time
set timefmt "%Y-%m-%d"
set xrange ["1994-03-19":"1995-09-03"]
set xtics "1994-03-19", 9158400, "1995-09-03"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Koncentrace H_3BO_3"
set output "graphs/Disneyland_05_bc.png"
plot "data/data13.csv" using 1:4 with points pointtype 1 lt rgb "green" notitle
