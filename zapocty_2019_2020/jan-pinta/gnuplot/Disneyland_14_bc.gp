set terminal png
set datafile separator ";"
set xdata time
set timefmt "%d.%m.%Y"
set xrange ["4.8.1981":"2.1.1983"]
set xtics "4.8.1981", 8899200, "2.1.1983"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Koncentrace H_3BO_3"
set output "graphs/Disneyland_14_bc.png"
plot "data/data38.csv" using 1:3 with points pointtype 1 lt rgb "green" notitle
