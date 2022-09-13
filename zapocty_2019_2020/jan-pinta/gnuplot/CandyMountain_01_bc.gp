set terminal png
set datafile separator ";"
set xdata time
set timefmt "%m/%d/%Y"
set xrange ["10/25/1982":"05/02/1984"]
set xtics "10/25/1982", 9590400, "05/02/1984"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Koncentrace H_3BO_3"
set output "graphs/CandyMountain_01_bc.png"
plot "data/data4.csv" using 1:2 with points pointtype 1 lt rgb "green" notitle
