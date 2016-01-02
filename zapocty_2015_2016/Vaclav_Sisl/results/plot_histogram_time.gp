set title "Histogram"
set xlabel "time spent in store [days]"
set ylabel "number of samples"
set terminal png
set output "results/plot_histogram_time.png"
binwidth=5
bin(x,width)=width*floor(x/width)
plot "results/plot_histogram_time.txt" using (bin($1,binwidth)):(1.0) smooth freq with boxes notitle
