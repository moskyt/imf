set terminal png
set datafile separator ";"
set xdata time
set timefmt "%m/%d/%Y"
set xrange ["04/18/1982":"02/23/1984"]
set xtics "04/18/1982", 11664000, "02/23/1984"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Koncentrace H_3BO_3"
set output "graphs/CandyMountain_08_bc.png"
plot "data/data23.csv" using 1:3 with points pointtype 1 lt rgb "green" notitle
