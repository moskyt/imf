set terminal png
set datafile separator ";"
set xdata time
set timefmt "%d.%m.%Y"
set xrange ["7.7.1989":"26.3.1991"]
set xtics "7.7.1989", 10800000, "26.3.1991"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Koncentrace H_3BO_3"
set output "graphs/Disneyland_11_bc.png"
plot "data/data32.csv" using 1:3 with points pointtype 1 lt rgb "green" notitle
