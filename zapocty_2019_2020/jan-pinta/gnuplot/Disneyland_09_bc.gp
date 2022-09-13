set terminal png
set datafile separator ";"
set xdata time
set timefmt "%Y-%m-%d"
set xrange ["1980-01-17":"1981-09-17"]
set xtics "1980-01-17", 10540800, "1981-09-17"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Koncentrace H_3BO_3"
set output "graphs/Disneyland_09_bc.png"
plot "data/data26.csv" using 1:2 with points pointtype 1 lt rgb "green" notitle
