set terminal png
set datafile separator ";"
set xdata time
set timefmt "%m/%d/%Y"
set xrange ["09/09/1982":"04/21/1984"]
set xtics "09/09/1982", 10195200, "04/21/1984"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Koncentrace H_3BO_3"
set output "graphs/Disneyland_01_bc.png"
plot "data/data3.csv" using 1:2 with points pointtype 1 lt rgb "green" notitle
