set terminal png
set datafile separator ";"
set xdata time
set timefmt "%d.%m.%Y"
set xrange ["14.2.1994":"23.7.1995"]
set xtics "14.2.1994", 9072000, "23.7.1995"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Koncentrace H_3BO_3"
set output "graphs/Atlantis_11_bc.png"
plot "data/data31.csv" using 1:4 with points pointtype 1 lt rgb "green" notitle