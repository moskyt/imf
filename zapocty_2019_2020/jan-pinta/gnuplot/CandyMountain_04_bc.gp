set terminal png
set datafile separator ";"
set xdata time
set timefmt "%Y-%m-%d"
set xrange ["1986-09-02":"1988-05-19"]
set xtics "1986-09-02", 10800000, "1988-05-19"
set format x "%m/%d/%Y"
set xlabel "Datum"
set ylabel "Koncentrace H_3BO_3"
set output "graphs/CandyMountain_04_bc.png"
plot "data/data10.csv" using 1:3 with points pointtype 1 lt rgb "green" notitle
