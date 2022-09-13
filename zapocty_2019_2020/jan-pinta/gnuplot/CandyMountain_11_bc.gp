set terminal png
set datafile separator ";"
set xdata time
set timefmt "%d.%m.%Y"
set xrange ["1.12.1986":"19.4.1988"]
set xtics "1.12.1986", 8726400, "19.4.1988"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Koncentrace H_3BO_3"
set output "graphs/CandyMountain_11_bc.png"
plot "data/data37.csv" using 1:2 with points pointtype 1 lt rgb "green" notitle
