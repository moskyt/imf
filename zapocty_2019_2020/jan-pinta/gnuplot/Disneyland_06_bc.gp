set terminal png
set datafile separator ";"
set xdata time
set timefmt "%Y-%m-%d"
set xrange ["1987-01-15":"1988-10-23"]
set xtics "1987-01-15", 11145600, "1988-10-23"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Koncentrace H_3BO_3"
set output "graphs/Disneyland_06_bc.png"
plot "data/data18.csv" using 1:4 with points pointtype 1 lt rgb "green" notitle
