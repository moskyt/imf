set title "Cycle {cycle}: {y_title}"
set nokey
set xlabel "date"
set ylabel "{y_title}"
set terminal png
set output "{variable}_{cycle}.png"
set xdata time
set timefmt "%m/%d/%Y"
plot "data_{cycle}.csv" using 1:{column} with linespoints