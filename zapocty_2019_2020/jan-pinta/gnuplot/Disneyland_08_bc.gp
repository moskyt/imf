set terminal png
set datafile separator ";"
set xdata time
set timefmt "%d.%m.%Y"
set xrange ["19.1.1998":"7.12.1999"]
set xtics "19.1.1998", 11836800, "7.12.1999"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Koncentrace H_3BO_3"
set output "graphs/Disneyland_08_bc.png"
plot "data/data21.csv" using 1:3 with points pointtype 1 lt rgb "green" notitle
