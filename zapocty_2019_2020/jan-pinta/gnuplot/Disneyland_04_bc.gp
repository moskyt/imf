set terminal png
set datafile separator ";"
set xdata time
set timefmt "%Y-%m-%d"
set xrange ["1986-09-22":"1988-02-27"]
set xtics "1986-09-22", 8985600, "1988-02-27"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Koncentrace H_3BO_3"
set output "graphs/Disneyland_04_bc.png"
plot "data/data12.csv" using 1:4 with points pointtype 1 lt rgb "green" notitle
